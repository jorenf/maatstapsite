<script setup lang="ts">
defineProps<{
  stats?: Array<{ value: string; label: string; style: string }>
}>()

const defaults = [
  { value: '240+',   label: 'bedrijven',            style: 'teal' },
  { value: '€ 2.4B',label: 'verwerkt in offertes', style: 'dark' },
  { value: '99.97%', label: 'uptime',               style: 'white' },
  { value: '4.9★',  label: 'klanttevredenheid',    style: 'accent' },
]

const styleMap: Record<string, { bg: string; color: string; border: boolean }> = {
  teal:   { bg: '#F0FDFA', color: '#115E59', border: false },
  dark:   { bg: '#0F172A', color: '#fff',    border: false },
  white:  { bg: '#fff',    color: '#0F172A', border: true },
  accent: { bg: '#5EEAD4', color: '#134E4A', border: false },
}
</script>

<template>
  <section class="py-8">
    <div class="ms-container">
      <div class="grid grid-cols-2 md:grid-cols-4 gap-3.5">
        <div
          v-for="s in (stats || defaults)"
          :key="s.label"
          class="flex flex-col justify-between rounded-xl p-6 md:p-7"
          style="min-height:120px"
          :style="{ background: styleMap[s.style]?.bg || '#fff', color: styleMap[s.style]?.color || '#0F172A', border: styleMap[s.style]?.border ? '1px solid #E2E8F0' : 'none' }"
        >
          <div class="font-semibold leading-none" style="font-size:clamp(28px,4vw,52px);letter-spacing:-0.035em">{{ s.value }}</div>
          <div class="text-[13px] font-medium opacity-75 mt-2">{{ s.label }}</div>
        </div>
      </div>
    </div>
  </section>
</template>
