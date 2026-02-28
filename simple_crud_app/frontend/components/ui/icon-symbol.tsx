import MaterialIcons from '@expo/vector-icons/MaterialIcons';
import { ComponentProps } from 'react';
import { OpaqueColorValue, StyleProp, TextStyle } from 'react-native';

type IconMapping = Record<string, ComponentProps<typeof MaterialIcons>['name']>;

const MAPPING: IconMapping = {
  'house.fill': 'home',
  'paperplane.fill': 'send',
  'gearshape.fill': 'settings', // added settings
  'chevron.left.forwardslash.chevron.right': 'code',
  'chevron.right': 'chevron-right',
};

export function IconSymbol({
  name,
  size = 24,
  color = '#000',
  style,
}: {
  name: keyof typeof MAPPING;
  size?: number;
  color?: string | OpaqueColorValue;
  style?: StyleProp<TextStyle>;
}) {
  return <MaterialIcons name={MAPPING[name]} size={size} color={color} style={style} />;
}