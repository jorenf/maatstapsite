<script setup lang="ts">
const props = withDefaults(defineProps<{
  variant?: 'primary' | 'dark' | 'ghost' | 'outline' | 'light'
  size?: 'sm' | 'md' | 'lg'
  icon?: string
  iconRight?: string
  full?: boolean
  href?: string
  type?: 'button' | 'submit' | 'reset'
}>(), {
  variant: 'primary',
  size: 'md',
  full: false,
  type: 'button',
})

const heights: Record<string, string> = { sm: '40px', md: '48px', lg: '56px' }
const fontSizes: Record<string, string> = { sm: '14px', md: '15px', lg: '17px' }
const paddings: Record<string, string> = { sm: '0 16px', md: '0 22px', lg: '0 28px' }
const iconSizes: Record<string, number> = { sm: 16, md: 18, lg: 20 }

const styles: Record<string, Record<string, string>> = {
  primary: { bg: '#0D9488', color: '#fff', border: '#0D9488', shadow: '0 1px 2px rgba(15,23,42,.04)' },
  dark:    { bg: '#0F172A', color: '#fff', border: '#0F172A', shadow: '0 1px 2px rgba(15,23,42,.04)' },
  ghost:   { bg: 'transparent', color: '#0F172A', border: 'transparent', shadow: 'none' },
  outline: { bg: 'transparent', color: '#0F172A', border: '#CBD5E1', shadow: 'none' },
  light:   { bg: '#fff', color: '#0F172A', border: '#fff', shadow: '0 1px 2px rgba(15,23,42,.04)' },
}

const tag = computed(() => props.href ? 'a' : 'button')
const v = computed(() => styles[props.variant])
</script>

<template>
  <component
    :is="tag"
    :href="href"
    :type="!href ? type : undefined"
    :style="{
      display: 'inline-flex',
      alignItems: 'center',
      justifyContent: 'center',
      gap: '8px',
      height: heights[size],
      padding: paddings[size],
      width: full ? '100%' : 'auto',
      fontSize: fontSizes[size],
      fontWeight: 500,
      letterSpacing: '-0.005em',
      background: v.bg,
      color: v.color,
      border: `1.5px solid ${v.border}`,
      borderRadius: '10px',
      cursor: 'pointer',
      boxShadow: v.shadow,
      transition: 'all .15s',
      whiteSpace: 'nowrap',
      textDecoration: 'none',
    }"
  >
    <AppIcon v-if="icon" :name="icon" :size="iconSizes[size]" />
    <slot />
    <AppIcon v-if="iconRight" :name="iconRight" :size="iconSizes[size]" />
  </component>
</template>
