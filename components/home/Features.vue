<script setup lang="ts">
const configuratorRows = [
  { label: 'Profiel', value: 'Aluminium 60×40', price: '€ 24,50/m', total: false },
  { label: 'Lengte', value: '2.400 mm', price: '× 8', total: false },
  { label: 'Coating', value: 'RAL 9005 mat', price: '+€ 18', total: false },
  { label: 'Subtotaal', value: '', price: '€ 564,80', total: true },
]

const flowSteps = ['Concept', 'Verstuurd', 'Bekeken', 'Akkoord ✓']
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <AppSectionHeading eyebrow="Wat erin zit" align="center" class="mb-12">
        <template #title>
          Eén systeem, <span class="font-display text-teal-700">vier</span> hoofdrolspelers.
        </template>
        <template #sub>
          Zet aan wat je vandaag nodig hebt. De rest staat klaar voor later.
        </template>
      </AppSectionHeading>

      <div
        class="grid gap-3.5"
        style="grid-template-columns:repeat(6,1fr);grid-auto-rows:minmax(260px,auto)"
      >
        <!-- Configurator — big dark tile -->
        <div
          class="col-span-4 p-8 rounded-xl relative overflow-hidden"
          style="background:#0F172A;color:#fff;border:1px solid #0F172A"
        >
          <div class="flex gap-2 mb-5">
            <span class="text-[11px] font-semibold px-2.5 py-1 rounded-full bg-teal-300 text-slate-900">Highlight</span>
            <span class="text-[11px] font-medium px-2.5 py-1 rounded-full text-white" style="background:rgba(255,255,255,.08)">Bespaart 4 uur/week</span>
          </div>
          <h3 class="text-[32px] font-semibold m-0 leading-tight" style="letter-spacing:-0.025em">
            Configurator die <span class="font-display text-teal-300">denkt</span> met je verkoper.
          </h3>
          <p class="text-[15px] text-slate-300 mt-3 mb-0 max-w-[480px] leading-relaxed">
            Varianten, afmetingen, marges — in 30 seconden een offerte zonder rekenmachine of gespreksleider in Excel.
          </p>
          <div
            class="mt-6 flex flex-col gap-2 p-3.5 rounded-xl"
            style="background:rgba(255,255,255,.04);border:1px solid rgba(255,255,255,.08)"
          >
            <div
              v-for="r in configuratorRows"
              :key="r.label"
              class="grid items-center gap-3 text-[13px]"
              style="grid-template-columns:110px 1fr auto"
              :style="{
                color: r.total ? '#fff' : '#CBD5E1',
                fontWeight: r.total ? 600 : 400,
                paddingTop: r.total ? '8px' : '0',
                borderTop: r.total ? '1px solid rgba(255,255,255,.1)' : 'none',
              }"
            >
              <span style="color:#94A3B8">{{ r.label }}</span>
              <span>{{ r.value }}</span>
              <span class="font-mono tabular-nums">{{ r.price }}</span>
            </div>
          </div>
        </div>

        <!-- Offertes & orders — teal tile -->
        <div class="col-span-2 p-8 rounded-xl" style="background:#5EEAD4;border:1px solid #5EEAD4">
          <div
            class="w-11 h-11 rounded-xl bg-slate-900 text-white inline-flex items-center justify-center mb-4"
          >
            <AppIcon name="fileText" :size="20" />
          </div>
          <h3 class="text-[22px] font-semibold m-0 mb-2 text-teal-900" style="letter-spacing:-0.02em">
            Offertes & orders
          </h3>
          <p class="text-sm text-teal-900 opacity-80 m-0 leading-relaxed">
            Eén flow van eerste contact tot factuur. Statusupdates landen automatisch waar ze moeten zijn.
          </p>
          <div class="mt-4 flex gap-1.5 flex-wrap">
            <span
              v-for="(t, i) in flowSteps"
              :key="t"
              class="text-[11px] font-medium px-2.5 py-1 rounded-full"
              :style="{
                background: i === 3 ? '#0F172A' : 'rgba(255,255,255,.5)',
                color: i === 3 ? '#fff' : '#134E4A',
              }"
            >{{ t }}</span>
          </div>
        </div>

        <!-- Klantportaal -->
        <div class="col-span-2 p-8 rounded-xl bg-white border border-slate-200">
          <div class="w-11 h-11 rounded-xl bg-teal-50 text-teal-700 inline-flex items-center justify-center mb-4">
            <AppIcon name="users" :size="20" />
          </div>
          <h3 class="text-[22px] font-semibold m-0 mb-2" style="letter-spacing:-0.02em">Klantportaal</h3>
          <p class="text-sm text-slate-600 m-0 leading-relaxed">
            Klanten checken zelf hun orders. Minder gepingel, meer goedgekeurde offertes.
          </p>
        </div>

        <!-- Modulair -->
        <div class="col-span-2 p-8 rounded-xl bg-slate-50 border border-slate-200">
          <div class="w-11 h-11 rounded-xl bg-white text-teal-700 inline-flex items-center justify-center mb-4 border border-slate-200">
            <AppIcon name="layers" :size="20" />
          </div>
          <h3 class="text-[22px] font-semibold m-0 mb-2" style="letter-spacing:-0.02em">Modulair</h3>
          <p class="text-sm text-slate-600 m-0 leading-relaxed">
            Begin klein. Voeg later voorraad, planning of API-koppelingen toe — zonder migratie-drama.
          </p>
        </div>

        <!-- Voorraad -->
        <div class="col-span-2 p-8 rounded-xl bg-white border border-slate-200">
          <div class="w-11 h-11 rounded-xl bg-teal-50 text-teal-700 inline-flex items-center justify-center mb-4">
            <AppIcon name="package" :size="20" />
          </div>
          <h3 class="text-[22px] font-semibold m-0 mb-2" style="letter-spacing:-0.02em">Voorraad live</h3>
          <p class="text-sm text-slate-600 m-0 leading-relaxed">
            Locaties, batches, serienummers. Eindelijk weet iedereen waar dat ene ding ligt.
          </p>
        </div>
      </div>
    </div>
  </section>
</template>
