<script setup lang="ts">
defineProps<{
  plans?: Array<{ name: string; price: string; desc: string; features: string[]; cta: string; highlight: boolean }>
}>()

const defaults = [
  { name: 'Starter',      price: '€ 89',      desc: 'Klein team, weg van Excel.',                   features: ['Tot 5 gebruikers','Offertes & orders','Klantenbeheer','E-mailsupport'],                                                          cta: 'Begin gratis',    highlight: false },
  { name: 'Professional', price: '€ 249',     desc: 'Het volledige pakket. 80% kiest hiervoor.',    features: ['Tot 25 gebruikers','Alles in Starter','Voorraad & inkoop','Configurator','Klantportaal','API-toegang'],                          cta: 'Probeer 14 dagen',highlight: true },
  { name: 'Enterprise',   price: 'Op aanvraag',desc: 'Maatwerk voor productie en groei.',           features: ['Onbeperkt gebruikers','Alles in Professional','Custom modules','SLA & 24/7 support','On-premise mogelijk'],                      cta: 'Plan gesprek',    highlight: false },
]
</script>

<template>
  <section class="py-20">
    <div class="ms-container">
      <AppSectionHeading eyebrow="Prijzen" align="center" class="mb-14">
        <template #title>Eerlijke <span class="font-display text-teal-700">tarieven</span>. Geen kleine lettertjes.</template>
        <template #sub>Wissel maandelijks. Bij vragen pakken we de telefoon op.</template>
      </AppSectionHeading>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 items-start">
        <div
          v-for="p in (plans || defaults)" :key="p.name"
          class="p-8 rounded-xl relative"
          :style="{ background: p.highlight?'#0F172A':'#fff', color: p.highlight?'#fff':'#0F172A', border: p.highlight?'1px solid #0F172A':'1px solid #E2E8F0', boxShadow: p.highlight?'0 20px 60px -20px rgba(13,148,136,.35)':'0 1px 2px rgba(15,23,42,.04)', transform: p.highlight?'scale(1.02)':'none' }"
        >
          <div v-if="p.highlight" class="absolute text-[12px] font-semibold px-3.5 py-1 rounded-full" style="top:-14px;left:32px;background:#5EEAD4;color:#0F172A;transform:rotate(-2deg);box-shadow:0 6px 14px -4px rgba(94,234,212,.6)">★ Populair</div>
          <div class="text-sm font-semibold mb-2" :class="p.highlight?'text-teal-300':'text-teal-700'">{{ p.name }}</div>
          <div class="flex items-baseline gap-1.5 mb-1.5">
            <span class="font-semibold" style="font-size:44px;letter-spacing:-0.03em">{{ p.price }}</span>
            <span v-if="p.price.startsWith('€')" class="text-sm" :class="p.highlight?'text-slate-400':'text-slate-500'">/ maand</span>
          </div>
          <p class="text-sm m-0 mb-6 leading-relaxed" style="min-height:42px" :class="p.highlight?'text-slate-300':'text-slate-600'">{{ p.desc }}</p>
          <AppButton :variant="p.highlight?'light':'dark'" :full="true" href="/contact">{{ p.cta }}</AppButton>
          <ul class="list-none p-0 m-0 mt-7 flex flex-col gap-3">
            <li v-for="f in p.features" :key="f" class="flex items-center gap-2.5 text-sm" :class="p.highlight?'text-slate-200':'text-slate-700'">
              <AppIcon name="check" :size="16" :color="p.highlight?'#5EEAD4':'#0D9488'" :stroke-width="2.2" />{{ f }}
            </li>
          </ul>
        </div>
      </div>

      <div class="text-center mt-8">
        <NuxtLink to="/pricing" class="text-[15px] text-teal-700 font-medium inline-flex items-center gap-1.5">
          Volledige vergelijking <AppIcon name="arrowRight" :size="16" />
        </NuxtLink>
      </div>
    </div>
  </section>
</template>
