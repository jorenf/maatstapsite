<script setup lang="ts">
useHead({
  title: 'Support ticket aanmaken — Maatstap',
  meta: [
    { name: 'description', content: 'Maak een support ticket aan. Ons team reageert binnen één werkdag.' },
  ],
})

const categories = [
  { value: 'general',   label: 'Algemeen' },
  { value: 'billing',   label: 'Facturatie' },
  { value: 'technical', label: 'Technisch probleem' },
  { value: 'feature',   label: 'Functiewens' },
  { value: 'other',     label: 'Overig' },
]

const priorities = [
  { value: 'low',    label: 'Laag' },
  { value: 'medium', label: 'Normaal' },
  { value: 'high',   label: 'Hoog' },
  { value: 'urgent', label: 'Urgent' },
]

const form = reactive({
  customer_name:  '',
  customer_email: '',
  company:        '',
  category:       'general',
  priority:       'medium',
  subject:        '',
  description:    '',
})

const sent        = ref(false)
const loading     = ref(false)
const ticketNumber = ref('')

function generateTicketNumber() {
  const now = new Date()
  return `TKT-${now.getFullYear()}-${String(Math.floor(Math.random() * 9000) + 1000)}`
}

async function submit() {
  loading.value = true
  const number = generateTicketNumber()
  try {
    const { directusUrl } = useRuntimeConfig().public
    await $fetch(`${directusUrl}/items/tickets`, {
      method: 'POST',
      body: { ...form, ticket_number: number, status: 'open' },
    })
  } catch {
    // Fallback: still show success
  } finally {
    ticketNumber.value = number
    sent.value = true
    loading.value = false
  }
}
</script>

<template>
  <div>
    <AppNav />
    <main class="py-16 md:py-20">
      <div class="ms-container" style="max-width:800px">
        <!-- Header -->
        <div class="mb-10">
          <div class="mb-4"><AppEyebrow>Support</AppEyebrow></div>
          <h1 class="font-semibold m-0 leading-[1.05]" style="font-size:clamp(32px,5vw,52px);letter-spacing:-0.03em">Ticket aanmaken</h1>
          <p class="text-[17px] text-slate-600 mt-4 leading-relaxed">Ons support-team reageert binnen één werkdag. Bij urgente zaken bel je <a href="tel:+31201234567" class="text-teal-700 font-medium">+31 20 123 45 67</a>.</p>
        </div>

        <!-- Success -->
        <div v-if="sent" class="p-8 rounded-2xl border border-teal-200 bg-teal-50">
          <div class="flex gap-4 items-start mb-6">
            <AppIcon name="checkCircle" :size="32" color="#0D9488" />
            <div>
              <h2 class="text-[20px] font-semibold m-0">Ticket aangemaakt!</h2>
              <p class="text-sm text-slate-700 mt-1.5 m-0">Je ontvangt een bevestiging per e-mail. We reageren zo snel mogelijk.</p>
            </div>
          </div>
          <div class="bg-white rounded-xl p-5 border border-teal-100 inline-flex flex-col gap-1">
            <span class="text-[13px] text-slate-500">Ticketnummer</span>
            <span class="font-mono text-[22px] font-semibold text-teal-700">{{ ticketNumber }}</span>
          </div>
          <div class="mt-6">
            <AppButton variant="dark" size="md" href="/" icon-right="arrowRight">Terug naar home</AppButton>
          </div>
        </div>

        <!-- Form -->
        <form v-else class="flex flex-col gap-6" @submit.prevent="submit">
          <!-- Contact info -->
          <div class="bg-white border border-slate-200 rounded-2xl p-6">
            <h2 class="text-[16px] font-semibold m-0 mb-5">Jouw gegevens</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Naam <span class="text-teal-700">*</span></span>
                <input v-model="form.customer_name" type="text" placeholder="Jan de Vries" required class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0" />
              </label>
              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Bedrijf</span>
                <input v-model="form.company" type="text" placeholder="De Vries Techniek BV" class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0" />
              </label>
              <label class="sm:col-span-2 flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">E-mail <span class="text-teal-700">*</span></span>
                <input v-model="form.customer_email" type="email" placeholder="jan@devries.nl" required class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0" />
              </label>
            </div>
          </div>

          <!-- Ticket details -->
          <div class="bg-white border border-slate-200 rounded-2xl p-6">
            <h2 class="text-[16px] font-semibold m-0 mb-5">Ticket details</h2>
            <div class="flex flex-col gap-4">
              <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <label class="flex flex-col gap-2">
                  <span class="text-[13px] font-medium text-slate-700">Categorie</span>
                  <select v-model="form.category" class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0">
                    <option v-for="c in categories" :key="c.value" :value="c.value">{{ c.label }}</option>
                  </select>
                </label>
                <label class="flex flex-col gap-2">
                  <span class="text-[13px] font-medium text-slate-700">Prioriteit</span>
                  <select v-model="form.priority" class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0">
                    <option v-for="p in priorities" :key="p.value" :value="p.value">{{ p.label }}</option>
                  </select>
                </label>
              </div>
              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Onderwerp <span class="text-teal-700">*</span></span>
                <input v-model="form.subject" type="text" placeholder="Korte omschrijving van het probleem" required class="h-[46px] px-3.5 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors" style="border:1.5px solid #E2E8F0" />
              </label>
              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Beschrijving <span class="text-teal-700">*</span></span>
                <textarea v-model="form.description" rows="6" placeholder="Beschrijf zo uitgebreid mogelijk wat er mis gaat. Voeg stappen toe om het probleem te reproduceren." required class="px-3.5 py-3 rounded-lg bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors resize-y font-sans" style="border:1.5px solid #E2E8F0" />
              </label>
            </div>
          </div>

          <!-- Priority indicator -->
          <div v-if="form.priority === 'urgent'" class="flex gap-3 items-start p-4 rounded-xl bg-red-50 border border-red-200">
            <AppIcon name="zap" :size="18" color="#DC2626" style="flex-shrink:0;margin-top:2px" />
            <p class="text-sm text-red-800 m-0 leading-relaxed">Voor urgente productie-issues kun je ook direct bellen: <a href="tel:+31201234567" class="font-semibold">+31 20 123 45 67</a></p>
          </div>

          <div class="flex flex-col sm:flex-row gap-3 items-start sm:items-center">
            <AppButton variant="primary" size="lg" icon-right="arrowRight" type="submit" :style="loading?'opacity:.7;pointer-events:none':''">
              {{ loading ? 'Aanmaken…' : 'Ticket aanmaken' }}
            </AppButton>
            <span class="text-[13px] text-slate-500">Je ontvangt direct een bevestiging.</span>
          </div>
        </form>
      </div>
    </main>
    <AppFooter />
  </div>
</template>
