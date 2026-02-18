import React from 'react';
import { View, Text, StyleSheet, Switch } from 'react-native';
import { useTheme } from '@/app/context/ThemeContext';

export default function SettingsScreen() {
  const { theme, toggleTheme } = useTheme();
  const isDark = theme === 'dark';

  return (
    <View
      style={[
        styles.container,
        { backgroundColor: isDark ? '#121212' : '#f9f9f9' },
      ]}
    >
      <Text
        style={[
          styles.header,
          { color: isDark ? '#ffffff' : '#000000' },
        ]}
      >
        Settings
      </Text>

      {/* Dark Mode Toggle */}
      <View style={styles.row}>
        <Text
          style={[
            styles.label,
            { color: isDark ? '#ffffff' : '#000000' },
          ]}
        >
          Dark Mode
        </Text>
        <Switch value={isDark} onValueChange={toggleTheme} />
      </View>

      {/* App Info */}
      <View style={styles.section}>
        <Text
          style={[
            styles.sectionHeader,
            { color: isDark ? '#ffffff' : '#000000' },
          ]}
        >
          About
        </Text>

        <Text
          style={[
            styles.sectionText,
            { color: isDark ? '#cccccc' : '#555555' },
          ]}
        >
          Todo App v1.0.0
        </Text>

        <Text
          style={[
            styles.sectionText,
            { color: isDark ? '#cccccc' : '#555555' },
          ]}
        >
          Built with Expo-React Native & Ruby on Rails
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    paddingTop: 65,
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
  },
  section: {
    marginTop: 30,
  },
  sectionHeader: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  sectionText: {
    fontSize: 14,
    marginBottom: 4,
  },
});
