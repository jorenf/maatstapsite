<script setup lang="ts">
const logos = [
  'Bouwgroep Noord', 'Havens Infra', 'De Vries Groep', 'Meurs Kunststof',
  'Jansen Techniek', 'Baumert', 'Korting & Zn.', 'Plaza Hardware',
]
const all = [...logos, ...logos]
</script>

<template>
  <section class="py-8 pb-16 overflow-hidden">
    <div class="ms-container">
      <div class="text-center text-[13px] font-medium text-slate-500 tracking-wide mb-6">
        240+ Nederlandse bedrijven runnen hun shop op Maatstap
      </div>
    </div>
    <div class="relative marquee-mask">
      <div class="flex gap-14 animate-marquee" style="width:max-content">
        <div
          v-for="(n, i) in all"
          :key="i"
          class="text-[22px] font-semibold text-slate-400 whitespace-nowrap tracking-snug"
          :class="i % 3 === 0 ? 'font-display' : ''"
        >
          {{ n }}
        </div>
      </div>
    </div>
  </section>
</template>
