// frontend/app/context/ThemeContext.tsx
import React, { createContext, useContext, useState, ReactNode } from "react";

// Define the type for your context value
interface ThemeContextType {
  theme: "light" | "dark";
  toggleTheme: () => void;
}

// Create the context with a default value (can be null initially)
const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

// Define props for the provider component
interface ThemeProviderProps {
  children: ReactNode;
}

export const ThemeProvider: React.FC<ThemeProviderProps> = ({ children }) => {
  const [theme, setTheme] = useState<"light" | "dark">("light");

  const toggleTheme = () => {
    setTheme((prev) => (prev === "light" ? "dark" : "light"));
  };

  return (
    <ThemeContext.Provider value={{ theme, toggleTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

// Custom hook for consuming the theme context
export const useTheme = (): ThemeContextType => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error("useTheme must be used within a ThemeProvider");
  }
  return context;
};

// ✅ Default export for Expo Router compatibility
export default ThemeProvider;