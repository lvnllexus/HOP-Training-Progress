import { View, Text, Switch, StyleSheet } from "react-native";
import { useTheme } from "@/app/context/ThemeContext";
import Constants from "expo-constants";

export default function SettingsScreen() {
  const { theme, toggleTheme } = useTheme();
  const isDark = theme === "dark";

  return (
    <View
      style={[
        styles.container,
        { backgroundColor: isDark ? "#121212" : "#ffffff" },
      ]}
    >
      <Text style={[styles.title, { color: isDark ? "#ffffff" : "#000000" }]}>
        Settings
      </Text>

      <View style={styles.row}>
        <Text style={{ color: isDark ? "#ffffff" : "#000000", fontSize: 16 }}>
          Dark Mode
        </Text>
        <Switch value={isDark} onValueChange={toggleTheme} />
      </View>

      <View style={styles.infoBox}>
        <Text style={{ color: isDark ? "#aaaaaa" : "#555555" }}>
          Version: {Constants.expoConfig?.version}
        </Text>

        <Text style={{ color: isDark ? "#aaaaaa" : "#555555", marginTop: 10 }}>
          Created using Expo + Ruby on Rails
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    paddingTop: 50,
  },
  title: {
    fontSize: 26,
    fontWeight: "bold",
    marginBottom: 30,
  },
  row: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginBottom: 30,
  },
  infoBox: {
    marginTop: 40,
  },
});