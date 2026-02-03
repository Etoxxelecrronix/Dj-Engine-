import React, { useState, useRef, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Animated,
  Dimensions,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { AppTheme } from '../theme/AppTheme';

const { width } = Dimensions.get('window');

export default function CounterPage() {
  const [count, setCount] = useState(0);

  // Animation values
  const scaleAnim = useRef(new Animated.Value(1)).current;
  const fadeAnim = useRef(new Animated.Value(1)).current;
  const buttonScaleInc = useRef(new Animated.Value(1)).current;
  const buttonScaleDec = useRef(new Animated.Value(1)).current;
  const buttonScaleReset = useRef(new Animated.Value(1)).current;
  const cardEntranceAnim = useRef(new Animated.Value(0)).current;

  // Entrance animation on mount
  useEffect(() => {
    Animated.spring(cardEntranceAnim, {
      toValue: 1,
      tension: 40,
      friction: 7,
      useNativeDriver: true,
    }).start();
  }, []);

  // Animate counter change
  const animateCountChange = () => {
    Animated.sequence([
      Animated.parallel([
        Animated.timing(scaleAnim, {
          toValue: 1.15,
          duration: 150,
          useNativeDriver: true,
        }),
        Animated.timing(fadeAnim, {
          toValue: 0.7,
          duration: 75,
          useNativeDriver: true,
        }),
      ]),
      Animated.parallel([
        Animated.spring(scaleAnim, {
          toValue: 1,
          tension: 50,
          friction: 3,
          useNativeDriver: true,
        }),
        Animated.timing(fadeAnim, {
          toValue: 1,
          duration: 75,
          useNativeDriver: true,
        }),
      ]),
    ]).start();
  };

  const handleIncrement = () => {
    // Button press animation
    Animated.sequence([
      Animated.timing(buttonScaleInc, {
        toValue: 0.9,
        duration: 100,
        useNativeDriver: true,
      }),
      Animated.spring(buttonScaleInc, {
        toValue: 1,
        tension: 50,
        friction: 3,
        useNativeDriver: true,
      }),
    ]).start();

    setCount(count + 1);
    animateCountChange();
  };

  const handleDecrement = () => {
    // Button press animation
    Animated.sequence([
      Animated.timing(buttonScaleDec, {
        toValue: 0.9,
        duration: 100,
        useNativeDriver: true,
      }),
      Animated.spring(buttonScaleDec, {
        toValue: 1,
        tension: 50,
        friction: 3,
        useNativeDriver: true,
      }),
    ]).start();

    setCount(count - 1);
    animateCountChange();
  };

  const handleReset = () => {
    // Button press animation
    Animated.sequence([
      Animated.timing(buttonScaleReset, {
        toValue: 0.9,
        duration: 100,
        useNativeDriver: true,
      }),
      Animated.spring(buttonScaleReset, {
        toValue: 1,
        tension: 50,
        friction: 3,
        useNativeDriver: true,
      }),
    ]).start();

    setCount(0);
    animateCountChange();
  };

  const cardTranslateY = cardEntranceAnim.interpolate({
    inputRange: [0, 1],
    outputRange: [50, 0],
  });

  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Simple Counter</Text>
        <Text style={styles.headerSubtitle}>Track your counts with style</Text>
      </View>

      {/* Main Counter Card */}
      <Animated.View
        style={[
          styles.counterCard,
          {
            opacity: cardEntranceAnim,
            transform: [{ translateY: cardTranslateY }],
          },
        ]}
      >
        <View style={styles.iconContainer}>
          <Ionicons
            name="calculator-outline"
            size={40}
            color={AppTheme.colors.primary}
          />
        </View>

        <Text style={styles.label}>Current Count</Text>

        <Animated.Text
          style={[
            styles.counterText,
            {
              transform: [{ scale: scaleAnim }],
              opacity: fadeAnim,
            },
          ]}
        >
          {count}
        </Animated.Text>

        {/* Action Buttons Row */}
        <View style={styles.buttonRow}>
          <Animated.View style={{ transform: [{ scale: buttonScaleDec }] }}>
            <TouchableOpacity
              style={[styles.actionButton, styles.decrementButton]}
              onPress={handleDecrement}
              activeOpacity={0.9}
            >
              <Ionicons name="remove" size={28} color="#FFFFFF" />
            </TouchableOpacity>
          </Animated.View>

          <Animated.View style={{ transform: [{ scale: buttonScaleReset }] }}>
            <TouchableOpacity
              style={[styles.actionButton, styles.resetButton]}
              onPress={handleReset}
              activeOpacity={0.9}
            >
              <Ionicons name="refresh" size={24} color={AppTheme.colors.text} />
            </TouchableOpacity>
          </Animated.View>

          <Animated.View style={{ transform: [{ scale: buttonScaleInc }] }}>
            <TouchableOpacity
              style={[styles.actionButton, styles.incrementButton]}
              onPress={handleIncrement}
              activeOpacity={0.9}
            >
              <Ionicons name="add" size={28} color="#FFFFFF" />
            </TouchableOpacity>
          </Animated.View>
        </View>
      </Animated.View>

      {/* Stats Cards */}
      <View style={styles.statsContainer}>
        <Animated.View
          style={[
            styles.statCard,
            {
              opacity: cardEntranceAnim,
              transform: [{ translateY: cardTranslateY }],
            },
          ]}
        >
          <Ionicons
            name="trending-up-outline"
            size={24}
            color={AppTheme.colors.success}
          />
          <Text style={styles.statValue}>{count > 0 ? `+${count}` : '0'}</Text>
          <Text style={styles.statLabel}>Positive</Text>
        </Animated.View>

        <Animated.View
          style={[
            styles.statCard,
            {
              opacity: cardEntranceAnim,
              transform: [{ translateY: cardTranslateY }],
            },
          ]}
        >
          <Ionicons
            name="trending-down-outline"
            size={24}
            color={AppTheme.colors.error}
          />
          <Text style={styles.statValue}>{count < 0 ? count : '0'}</Text>
          <Text style={styles.statLabel}>Negative</Text>
        </Animated.View>
      </View>

      {/* Info Card */}
      <Animated.View
        style={[
          styles.infoCard,
          {
            opacity: cardEntranceAnim,
            transform: [{ translateY: cardTranslateY }],
          },
        ]}
      >
        <Ionicons
          name="information-circle"
          size={24}
          color={AppTheme.colors.primary}
          style={styles.infoIcon}
        />
        <View style={styles.infoTextContainer}>
          <Text style={styles.infoTitle}>Quick Tips</Text>
          <Text style={styles.infoText}>
            Use + and - buttons to count, or tap reset to start over
          </Text>
        </View>
      </Animated.View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: AppTheme.colors.background,
    paddingHorizontal: AppTheme.spacing.lg,
  },
  header: {
    marginTop: AppTheme.spacing.xl,
    marginBottom: AppTheme.spacing.lg,
  },
  headerTitle: {
    fontSize: AppTheme.typography.fontSize.display,
    fontWeight: AppTheme.typography.fontWeight.bold as any,
    color: AppTheme.colors.text,
    marginBottom: AppTheme.spacing.xs,
  },
  headerSubtitle: {
    fontSize: AppTheme.typography.fontSize.md,
    color: AppTheme.colors.textSecondary,
    fontWeight: AppTheme.typography.fontWeight.normal as any,
  },
  counterCard: {
    backgroundColor: AppTheme.colors.surface,
    borderRadius: AppTheme.borderRadius.xl,
    padding: AppTheme.spacing.xl,
    alignItems: 'center',
    ...AppTheme.elevation.lg,
    marginBottom: AppTheme.spacing.lg,
  },
  iconContainer: {
    width: 80,
    height: 80,
    borderRadius: AppTheme.borderRadius.full,
    backgroundColor: AppTheme.colors.primary + '15',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: AppTheme.spacing.md,
  },
  label: {
    fontSize: AppTheme.typography.fontSize.md,
    color: AppTheme.colors.textSecondary,
    fontWeight: AppTheme.typography.fontWeight.medium as any,
    marginBottom: AppTheme.spacing.sm,
    textTransform: 'uppercase',
    letterSpacing: 1,
  },
  counterText: {
    fontSize: 72,
    fontWeight: AppTheme.typography.fontWeight.bold as any,
    color: AppTheme.colors.primary,
    marginBottom: AppTheme.spacing.xl,
  },
  buttonRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: AppTheme.spacing.md,
  },
  actionButton: {
    width: 64,
    height: 64,
    borderRadius: AppTheme.borderRadius.full,
    alignItems: 'center',
    justifyContent: 'center',
    ...AppTheme.elevation.md,
  },
  incrementButton: {
    backgroundColor: AppTheme.colors.primary,
  },
  decrementButton: {
    backgroundColor: AppTheme.colors.error,
  },
  resetButton: {
    backgroundColor: AppTheme.colors.border,
    width: 56,
    height: 56,
  },
  statsContainer: {
    flexDirection: 'row',
    gap: AppTheme.spacing.md,
    marginBottom: AppTheme.spacing.lg,
  },
  statCard: {
    flex: 1,
    backgroundColor: AppTheme.colors.surface,
    borderRadius: AppTheme.borderRadius.lg,
    padding: AppTheme.spacing.lg,
    alignItems: 'center',
    ...AppTheme.elevation.sm,
  },
  statValue: {
    fontSize: AppTheme.typography.fontSize.heading,
    fontWeight: AppTheme.typography.fontWeight.bold as any,
    color: AppTheme.colors.text,
    marginTop: AppTheme.spacing.sm,
    marginBottom: AppTheme.spacing.xs,
  },
  statLabel: {
    fontSize: AppTheme.typography.fontSize.sm,
    color: AppTheme.colors.textSecondary,
    fontWeight: AppTheme.typography.fontWeight.medium as any,
  },
  infoCard: {
    backgroundColor: AppTheme.colors.primary + '10',
    borderRadius: AppTheme.borderRadius.md,
    padding: AppTheme.spacing.lg,
    flexDirection: 'row',
    alignItems: 'flex-start',
    borderLeftWidth: 4,
    borderLeftColor: AppTheme.colors.primary,
  },
  infoIcon: {
    marginRight: AppTheme.spacing.md,
    marginTop: 2,
  },
  infoTextContainer: {
    flex: 1,
  },
  infoTitle: {
    fontSize: AppTheme.typography.fontSize.md,
    fontWeight: AppTheme.typography.fontWeight.semibold as any,
    color: AppTheme.colors.primary,
    marginBottom: AppTheme.spacing.xs,
  },
  infoText: {
    fontSize: AppTheme.typography.fontSize.sm,
    color: AppTheme.colors.textSecondary,
    lineHeight: AppTheme.typography.fontSize.sm * AppTheme.typography.lineHeight.relaxed,
  },
});
