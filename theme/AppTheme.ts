// This file contains ONLY theme definitions - no imports, no logic

export const LightTheme = {
  colors: {
    // SimpleCounter App - Modern Blue & Amber theme
    primary: '#2196F3',      // Material Blue
    secondary: '#FFC107',    // Amber
    background: '#F5F7FA',   // Light gray-blue background
    surface: '#FFFFFF',      // White cards/surfaces
    text: '#1A1A1A',         // Almost black text
    textSecondary: '#6B7280', // Gray text
    success: '#10B981',      // Green
    error: '#EF4444',        // Red
    border: '#E5E7EB',       // Light gray border

    // Modern gradient presets for premium look
    gradient: {
      primary: ['#2196F3', '#1976D2'], // Blue gradient
      secondary: ['#FFC107', '#FFA000'], // Amber gradient
      success: ['#11998e', '#38ef7d'],
      info: ['#4facfe', '#00f2fe'],
      warning: ['#fa709a', '#fee140'],
      danger: ['#ee0979', '#ff6a00'],
      dark: ['#232526', '#414345'],
    },
    // Glassmorphism colors
    glass: {
      light: 'rgba(255, 255, 255, 0.1)',
      medium: 'rgba(255, 255, 255, 0.2)',
      dark: 'rgba(0, 0, 0, 0.1)',
      border: 'rgba(255, 255, 255, 0.18)',
    },
  },
  spacing: {
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
    xxl: 40,
  },
  borderRadius: {
    xs: 4,
    sm: 8,
    md: 12,
    lg: 16,
    xl: 24,
    xxl: 32,
    full: 9999,
  },
  // Modern elevation system (shadows & depth)
  elevation: {
    none: {
      shadowColor: 'transparent',
      shadowOffset: { width: 0, height: 0 },
      shadowOpacity: 0,
      shadowRadius: 0,
      elevation: 0,
    },
    xs: {
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 1 },
      shadowOpacity: 0.05,
      shadowRadius: 2,
      elevation: 1,
    },
    sm: {
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 2 },
      shadowOpacity: 0.1,
      shadowRadius: 4,
      elevation: 3,
    },
    md: {
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 4 },
      shadowOpacity: 0.15,
      shadowRadius: 8,
      elevation: 6,
    },
    lg: {
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 8 },
      shadowOpacity: 0.2,
      shadowRadius: 16,
      elevation: 12,
    },
    xl: {
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 12 },
      shadowOpacity: 0.25,
      shadowRadius: 24,
      elevation: 18,
    },
  },
  typography: {
    fontSize: {
      xs: 10,
      sm: 12,
      md: 14,
      lg: 16,
      xl: 18,
      xxl: 20,
      title: 20,
      heading: 24,
      display: 28,
    },
    fontWeight: {
      light: '300',
      normal: '400',
      medium: '500',
      semibold: '600',
      bold: '700',
      extrabold: '800',
    },
    lineHeight: {
      tight: 1.2,
      normal: 1.5,
      relaxed: 1.75,
    },
  },
  // Animation timing constants
  animation: {
    fast: 150,
    normal: 300,
    slow: 500,
    verySlow: 800,
  },
  // Opacity levels for consistent alpha values
  opacity: {
    disabled: 0.4,
    hover: 0.8,
    pressed: 0.6,
    overlay: 0.5,
  },
};

export const AppTheme = LightTheme;
