<script setup lang="ts">
const addons = [
  { icon: 'users',    name: 'Klantportaal',         desc: 'Geef je klanten zelf inzage in orders, facturen en levertijden.', price: 49 },
  { icon: 'package',  name: 'Voorraad & magazijn',  desc: 'Real-time voorraad, locaties, batch- en serienummers.',           price: 79 },
  { icon: 'globe',    name: 'API & webhooks',        desc: 'Koppel met je webshop, boekhouding of eigen tools.',              price: 39 },
  { icon: 'trendUp',  name: 'Rapportage dashboard', desc: "Dashboards op maat: omzet, marges, KPI's, exports.",              price: 59 },
]
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <AppSectionHeading eyebrow="Modules" align="center" class="mb-14">
        <template #title>Add-on modules</template>
        <template #sub>Activeer alleen wat je nodig hebt. Wissel maandelijks.</template>
      </AppSectionHeading>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div v-for="a in addons" :key="a.name" class="flex gap-5 p-6 bg-white border border-slate-200 rounded-2xl">
          <div class="w-12 h-12 rounded-xl bg-teal-50 text-teal-700 inline-flex items-center justify-center flex-shrink-0"><AppIcon :name="a.icon" :size="22" /></div>
          <div class="flex-1">
            <div class="flex items-start justify-between gap-3 mb-1.5 flex-wrap">
              <h3 class="text-[17px] font-semibold m-0">{{ a.name }}</h3>
              <div class="text-sm font-medium text-slate-500 whitespace-nowrap">vanaf <span class="text-slate-900 font-semibold">€ {{ a.price }}</span> / mnd</div>
            </div>
            <p class="text-sm text-slate-600 m-0 leading-relaxed">{{ a.desc }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
