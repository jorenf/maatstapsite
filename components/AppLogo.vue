<script setup lang="ts">
withDefaults(defineProps<{
  size?: number
  dark?: boolean
}>(), {
  size: 28,
  dark: false,
})
</script>

<template>
  <span class="inline-flex items-center" :style="{ gap: '10px' }">
    <svg :width="size" :height="size" viewBox="0 0 32 32" style="display:block">
      <rect x="3" y="20" width="9" height="9" rx="2" fill="#5EEAD4" />
      <rect x="10" y="13" width="9" height="9" rx="2" fill="#14B8A6" />
      <rect x="17" y="6" width="9" height="9" rx="2" fill="#0F766E" />
      <circle cx="27" cy="6" r="2.5" fill="#5EEAD4" />
    </svg>
    <span
      :style="{
        fontSize: size * 0.72 + 'px',
        fontWeight: 600,
        letterSpacing: '-0.025em',
        color: dark ? '#fff' : '#0F172A',
      }"
    >maatstap</span>
  </span>
</template>
