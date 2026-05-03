<script setup lang="ts">
const stats = [
  { value: '240+', label: 'bedrijven', bg: '#F0FDFA', color: '#115E59', border: false },
  { value: '€ 2.4B', label: 'verwerkt in offertes', bg: '#0F172A', color: '#fff', border: false },
  { value: '99.97%', label: 'uptime', bg: '#fff', color: '#0F172A', border: true },
  { value: '4.9★', label: 'klanttevredenheid', bg: '#5EEAD4', color: '#134E4A', border: false },
]
</script>

<template>
  <section class="py-8">
    <div class="ms-container">
      <div class="grid grid-cols-4 gap-3.5">
        <div
          v-for="s in stats"
          :key="s.label"
          class="flex flex-col justify-between rounded-xl p-7"
          style="min-height:130px"
          :style="{
            background: s.bg,
            color: s.color,
            border: s.border ? '1px solid #E2E8F0' : 'none',
          }"
        >
          <div
            class="font-semibold leading-none"
            style="font-size:clamp(36px,4vw,52px);letter-spacing:-0.035em"
          >
            {{ s.value }}
          </div>
          <div class="text-[13px] font-medium opacity-75 mt-2">{{ s.label }}</div>
        </div>
      </div>
    </div>
  </section>
</template>
