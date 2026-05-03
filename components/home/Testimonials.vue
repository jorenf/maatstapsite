<script setup lang="ts">
const testimonials = [
  {
    quote: '"Een week zoeken in Excel was de standaard. Nu zie ik alles in één scherm."',
    name: 'Jeroen Bouwman',
    role: 'Inkoopmanager · Bouwgroep Noord',
    bg: '#5EEAD4',
    color: '#134E4A',
    starColor: '#134E4A',
    border: false,
    offset: false,
  },
  {
    quote: '"De configurator voelt als magie. Verkopers maken offertes in de auto."',
    name: 'Anouk de Wit',
    role: 'Directeur · Meurs Kunststof',
    bg: '#fff',
    color: '#0F172A',
    starColor: '#0D9488',
    border: true,
    offset: true,
  },
  {
    quote: '"Migratie binnen 5 dagen. Geen drama, geen downtime. Echt zeldzaam."',
    name: 'Pieter Havens',
    role: 'CEO · Havens Infra',
    bg: '#0F172A',
    color: '#fff',
    starColor: '#5EEAD4',
    border: false,
    offset: false,
  },
]
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <div class="grid grid-cols-3 gap-4">
        <div
          v-for="t in testimonials"
          :key="t.name"
          class="p-8 rounded-xl flex flex-col gap-6"
          :style="{
            background: t.bg,
            color: t.color,
            border: t.border ? '1px solid #E2E8F0' : 'none',
            transform: t.offset ? 'translateY(20px)' : 'none',
          }"
        >
          <div class="flex gap-0.5">
            <AppIcon
              v-for="i in 5"
              :key="i"
              name="star"
              :size="16"
              :color="t.starColor"
              :stroke-width="1"
              style="fill:currentColor"
            />
          </div>
          <p
            class="text-[19px] font-medium m-0 flex-1 leading-snug"
            style="letter-spacing:-0.012em"
          >{{ t.quote }}</p>
          <div>
            <div class="text-sm font-semibold">{{ t.name }}</div>
            <div class="text-[12px] opacity-70">{{ t.role }}</div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
