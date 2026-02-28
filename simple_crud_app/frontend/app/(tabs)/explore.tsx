import { View, Text } from "react-native";
import { useTheme } from "@/app/context/ThemeContext";

export default function ExploreScreen() {
  const { theme } = useTheme();
  const isDark = theme === "dark";

  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: isDark ? "#121212" : "#ffffff",
      }}
    >
      <Text style={{ color: isDark ? "#ffffff" : "#000000", fontSize: 20 }}>
        Explore Screen
      </Text>
    </View>
  );
}