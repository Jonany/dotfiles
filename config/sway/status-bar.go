package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
	"regexp"
	"strings"
	"time"
)

func getSensors() string {
	cmd := exec.Command("sensors")
	output, err := cmd.Output()
	if err != nil {
		return ""
	}

	lines := bytes.Split(output, []byte("\n"))
	for _, line := range lines {
		if bytes.Contains(line, []byte("Package")) {
			parts := strings.Fields(string(line))
			if len(parts) >= 5 {
				// Remove '+' and '.0'
				temp := strings.TrimPrefix(parts[4], "+")
				temp = strings.TrimSuffix(temp, ".0")
				return temp
			}
		}
	}
	return ""
}

func getVolume() string {
	cmd := exec.Command("wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@")
	output, err := cmd.Output()
	if err != nil {
		return "X"
	}

	parts := strings.Fields(string(output))
	if len(parts) < 2 {
		return "X"
	}

	volumePart := parts[1]
	muteStatus := parts[2]

	// Check if muted
	if strings.Contains(muteStatus, "MUTED") {
		return "X"
	}

	// Extract volume percentage and remove leading '0.'
	volumePercentStr := strings.TrimPrefix(volumePart, "0.")
	return volumePercentStr + "%"
}

func getBatteryInfo() (string, string) {
	cmd := exec.Command("acpi", "-b")
	output, err := cmd.Output()
	if err != nil {
		return "", ""
	}

	fields := regexp.MustCompile(`[,\s]`).Split(string(output), -1)
	if len(fields) < 5 {
		return "", ""
	}

	chargeStatus := fields[2]
	batPercent := fields[3]

	var chargeIcon string
	switch chargeStatus {
	case "Charging":
		chargeIcon = "(+)"
	case "Discharging":
		chargeIcon = "(-)"
	case "Full":
		chargeIcon = "(*)"
	default:
		chargeIcon = ""
	}

	return batPercent, chargeIcon
}

func getNetworkStatus() string {
	cmd := exec.Command("/sbin/iwconfig", "wlp2s0")
	output, err := cmd.Output()
	if err != nil {
		return "Disconnected"
	}

	outputStr := string(output)
	if strings.Contains(outputStr, "ESSID:off/any") {
		return "Disconnected"
	}

	// Extract network name
	re := regexp.MustCompile(`ESSID:"(.*?)"`)
	matches := re.FindStringSubmatch(outputStr)
	if len(matches) > 1 {
		return "Connected"
	}

	return "Disconnected"
}

func getBluetoothStatus() string {
	// Check bluetooth power state
	cmd := exec.Command("bluetoothctl", "show")
	powerOutput, err := cmd.Output()
	if err != nil {
		return ""
	}

	powerStateMatch := regexp.MustCompile(`PowerState:\s*(\w+)`).FindSubmatch(powerOutput)
	if len(powerStateMatch) < 2 {
		return ""
	}
	powerState := string(powerStateMatch[1])

	if powerState == "off" {
		return "OFF // "
	}

	// Check connected devices
	cmd = exec.Command("bluetoothctl", "devices", "Connected")
	devOutput, err := cmd.Output()
	if err != nil {
		return ""
	}

	deviceMatch := regexp.MustCompile(`Device\s+\S+\s+(.+)`).FindSubmatch(devOutput)
	if len(deviceMatch) > 1 {
		return string(deviceMatch[1]) + " // "
	}

	return ""
}

func main() {
	date := time.Now().Format("Mon 2006-01-02 15:04")
	cpu := getSensors()
	volume := getVolume()
	batPercent, chargeIcon := getBatteryInfo()
	networkStatus := getNetworkStatus()
	btStatus := getBluetoothStatus()

	fmt.Printf("%s%s // %s%s // %s // %s // %s\n",
		btStatus, volume, batPercent, chargeIcon, cpu, networkStatus, date)
}
