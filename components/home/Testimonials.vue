<script setup lang="ts">
defineProps<{
  testimonials?: Array<{ quote: string; name: string; role: string; style: string }>
}>()

const defaults = [
  { quote: '"Een week zoeken in Excel was de standaard. Nu zie ik alles in één scherm."', name: 'Jeroen Bouwman', role: 'Inkoopmanager · Bouwgroep Noord', style: 'teal' },
  { quote: '"De configurator voelt als magie. Verkopers maken offertes in de auto."',     name: 'Anouk de Wit',   role: 'Directeur · Meurs Kunststof',      style: 'white' },
  { quote: '"Migratie binnen 5 dagen. Geen drama, geen downtime. Echt zeldzaam."',        name: 'Pieter Havens',  role: 'CEO · Havens Infra',               style: 'dark' },
]

const styleMap: Record<string, { bg: string; color: string; star: string; border: boolean }> = {
  teal:  { bg: '#5EEAD4', color: '#134E4A', star: '#134E4A', border: false },
  white: { bg: '#fff',    color: '#0F172A', star: '#0D9488', border: true  },
  dark:  { bg: '#0F172A', color: '#fff',    star: '#5EEAD4', border: false },
}
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div
          v-for="(t, i) in (testimonials || defaults)" :key="t.name"
          class="p-8 rounded-xl flex flex-col gap-6"
          :style="{
            background: styleMap[t.style]?.bg || '#fff',
            color: styleMap[t.style]?.color || '#0F172A',
            border: styleMap[t.style]?.border ? '1px solid #E2E8F0' : 'none',
            transform: i === 1 ? 'translateY(0)' : 'none',
          }"
        >
          <div class="flex gap-0.5">
            <AppIcon v-for="s in 5" :key="s" name="star" :size="16" :color="styleMap[t.style]?.star || '#0D9488'" :stroke-width="1" style="fill:currentColor" />
          </div>
          <p class="text-[19px] font-medium m-0 flex-1 leading-snug" style="letter-spacing:-0.012em">{{ t.quote }}</p>
          <div>
            <div class="text-sm font-semibold">{{ t.name }}</div>
            <div class="text-[12px] opacity-70">{{ t.role }}</div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
