<script setup lang="ts">
const props = defineProps<{ faqs?: any[] }>()

const defaults = [
  { question: 'Kan ik wisselen tussen plans?',                  answer: 'Ja, op elk moment. Je upgrade gaat direct in, een downgrade gaat in op je volgende factuurdatum.' },
  { question: 'Wat gebeurt er na de proefperiode van 14 dagen?',answer: 'Je proefperiode eindigt zonder kosten — er is geen creditcard nodig om te starten. Wil je doorgaan, dan kies je een plan en activeer je je account.' },
  { question: 'Is er een setup-fee?',                           answer: 'Nee. Onboarding, datamigratie van je huidige systeem en het opzetten van templates zijn inbegrepen.' },
  { question: 'Hoe zit het met mijn data?',                     answer: 'Jouw data is van jou. Servers staan in Amsterdam (ISO 27001), dagelijkse back-ups, en bij opzegging krijg je een volledige export in standaardformaten.' },
  { question: 'Krijg ik korting bij meerdere modules?',         answer: 'Bij 3 of meer add-ons krijg je 15% korting op de modules. Bij Enterprise-plannen worden modules in het maatwerktarief meegenomen.' },
  { question: 'Werken jullie met accountants?',                 answer: 'Ja. We hebben directe koppelingen met Exact Online, Twinfield, AFAS en e-Boekhouden. Andere pakketten via API.' },
]

const displayFaqs = computed(() => props.faqs || defaults)
const open = ref(0)
</script>

<template>
  <section class="py-20">
    <div class="ms-container" style="max-width:800px">
      <AppSectionHeading eyebrow="Veelgestelde vragen" align="center" class="mb-12">
        <template #title>Vragen die wij vaak horen.</template>
      </AppSectionHeading>
      <div class="bg-white border border-slate-200 rounded-2xl">
        <div v-for="(f, i) in displayFaqs" :key="i" :class="i>0?'border-t border-slate-100':''">
          <button class="w-full px-6 py-5 flex items-center justify-between bg-transparent border-none cursor-pointer text-left gap-4 text-[16px] font-medium text-slate-900" @click="open = open===i?-1:i">
            {{ f.question || f.q }}
            <AppIcon :name="open===i?'minus':'plus'" :size="20" color="#94A3B8" />
          </button>
          <div v-if="open===i" class="px-6 pb-5 text-[15px] text-slate-600 leading-relaxed">{{ f.answer || f.a }}</div>
        </div>
      </div>
    </div>
  </section>
</template>
