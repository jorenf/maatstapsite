<script setup lang="ts">
defineProps<{ annual: boolean }>()

const plans = [
  {
    name: 'Starter',
    monthly: 89,
    yearly: 74,
    desc: 'Voor kleine teams die overstappen van Excel.',
    cta: 'Begin gratis',
    highlight: false,
    features: ['Tot 5 gebruikers', 'Klanten & contacten', 'Offertes & orders', 'Basis artikelbeheer', 'PDF-templates', 'E-mailsupport'],
  },
  {
    name: 'Professional',
    monthly: 249,
    yearly: 207,
    desc: 'De volledige set voor het mkb. 80% kiest hiervoor.',
    cta: 'Probeer 14 dagen',
    highlight: true,
    features: ['Tot 25 gebruikers', 'Alles in Starter', 'Voorraad & inkoop', 'Configurator', 'Klantportaal', 'Rapportage dashboard', 'API-toegang', 'Telefonische support'],
  },
  {
    name: 'Enterprise',
    monthly: null,
    yearly: null,
    desc: 'Maatwerk voor productiebedrijven met eigen processen.',
    cta: 'Plan gesprek',
    highlight: false,
    features: ['Onbeperkt gebruikers', 'Alles in Professional', 'Custom modules', 'SSO & rolbeheer', 'Productieplanning', 'On-premise mogelijk', 'SLA & support 24/7', 'Toegewezen account manager'],
  },
]
</script>

<template>
  <section class="pt-10 pb-20">
    <div class="ms-container">
      <div class="grid grid-cols-3 gap-5">
        <div
          v-for="p in plans"
          :key="p.name"
          class="p-8 rounded-2xl relative"
          :style="{
            background: p.highlight ? '#0F172A' : '#fff',
            color: p.highlight ? '#fff' : '#0F172A',
            border: p.highlight ? '1px solid #0F172A' : '1px solid #E2E8F0',
            boxShadow: p.highlight ? '0 20px 60px -20px rgba(13,148,136,.35)' : '0 1px 2px rgba(15,23,42,.04)',
          }"
        >
          <div
            v-if="p.highlight"
            class="absolute text-[12px] font-semibold px-3 py-1 rounded-full"
            style="top:-12px;left:32px;background:#5EEAD4;color:#0F172A"
          >Populair</div>

          <div
            class="text-sm font-semibold mb-2"
            :class="p.highlight ? 'text-teal-300' : 'text-teal-700'"
          >{{ p.name }}</div>

          <div class="flex items-baseline gap-1.5 mb-1.5">
            <span class="font-semibold" style="font-size:44px;letter-spacing:-0.025em">
              {{ p.monthly == null ? 'Op aanvraag' : `€ ${annual ? p.yearly : p.monthly}` }}
            </span>
            <span
              v-if="p.monthly != null"
              class="text-sm"
              :class="p.highlight ? 'text-slate-400' : 'text-slate-500'"
            >/ mnd</span>
          </div>

          <p
            class="text-sm m-0 mb-6 leading-relaxed"
            style="min-height:42px"
            :class="p.highlight ? 'text-slate-300' : 'text-slate-600'"
          >{{ p.desc }}</p>

          <AppButton :variant="p.highlight ? 'light' : 'dark'" :full="true" href="/contact">
            {{ p.cta }}
          </AppButton>

          <ul class="list-none p-0 m-0 mt-7 flex flex-col gap-3">
            <li
              v-for="f in p.features"
              :key="f"
              class="flex items-center gap-2.5 text-sm"
              :class="p.highlight ? 'text-slate-200' : 'text-slate-700'"
            >
              <AppIcon name="check" :size="16" :color="p.highlight ? '#5EEAD4' : '#0D9488'" :stroke-width="2.2" />
              {{ f }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>
