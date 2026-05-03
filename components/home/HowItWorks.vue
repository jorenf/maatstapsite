<script setup lang="ts">
const steps = [
  { n: '01', title: 'Bel ons',    desc: 'Korte sessie. We luisteren naar je proces, niet aan een script.',          day: 'Dag 0' },
  { n: '02', title: 'Data over',  desc: 'We trekken klanten, artikelen en open orders over. Jij blijft draaien.',   day: 'Dag 1–3' },
  { n: '03', title: 'Live',       desc: 'Templates klaar, team getraind, livegang met support naast je.',           day: 'Dag 5–7' },
]
</script>

<template>
  <section class="py-20 rounded-3xl mx-3 md:mx-6 my-10" style="background:#0F172A;color:#fff">
    <div class="ms-container">
      <AppSectionHeading align="center" class="mb-14">
        <template #title><span class="text-white">Van Excel naar <span class="font-display text-teal-300">op orde</span> in een week.</span></template>
        <template #sub><span class="text-slate-400">We migreren je data, zetten templates op en trainen je team. Geen surprises.</span></template>
      </AppSectionHeading>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div v-for="s in steps" :key="s.n" class="p-7 rounded-xl" style="background:rgba(255,255,255,.04);border:1px solid rgba(255,255,255,.08)">
          <div class="flex justify-between items-center mb-8">
            <span class="font-mono text-[13px] text-teal-300">{{ s.n }}</span>
            <span class="text-[11px] font-medium px-2.5 py-1 rounded-full text-teal-300" style="background:rgba(94,234,212,.12)">{{ s.day }}</span>
          </div>
          <h3 class="text-[26px] font-semibold m-0 mb-2" style="letter-spacing:-0.025em">{{ s.title }}</h3>
          <p class="text-sm text-slate-400 m-0 leading-relaxed">{{ s.desc }}</p>
        </div>
      </div>
    </div>
  </section>
</template>
