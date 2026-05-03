<script setup lang="ts">
useHead({
  title: 'Contact — Maatstap',
  meta: [
    { name: 'description', content: 'Neem contact op met Maatstap. Demo aanvragen, vragen stellen of direct bellen. We reageren binnen één werkdag.' },
    { property: 'og:title', content: 'Contact — Maatstap' },
  ],
  script: [
    {
      type: 'application/ld+json',
      innerHTML: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'ContactPage',
        name: 'Contact Maatstap',
        description: 'Neem contact op voor een vrijblijvende demo of stel je vraag',
      }),
    },
  ],
})

const form = reactive({
  naam: '',
  bedrijf: '',
  email: '',
  telefoon: '',
  medewerkers: '',
  systeem: '',
  bericht: '',
})

const sent = ref(false)
const loading = ref(false)

async function submit() {
  loading.value = true
  await new Promise(r => setTimeout(r, 600))
  sent.value = true
  loading.value = false
}
</script>

<template>
  <div>
    <AppNav active="contact" />
    <main class="py-20">
      <div class="ms-container">
        <div
          class="grid gap-16 items-start"
          style="grid-template-columns:1.4fr 1fr"
        >
          <!-- Left: form -->
          <div>
            <div class="mb-4">
              <AppEyebrow>Contact</AppEyebrow>
            </div>
            <h1
              class="font-semibold m-0 leading-[1.05]"
              style="font-size:clamp(36px,5vw,56px);letter-spacing:-0.03em"
            >
              Laten we praten.
            </h1>
            <p class="text-[19px] text-slate-600 max-w-[460px] mt-5 mb-10 leading-relaxed">
              Vertel ons kort over je bedrijf en waar je tegenaan loopt. We nemen binnen één werkdag contact op voor een vrijblijvende demo.
            </p>

            <!-- Success state -->
            <div
              v-if="sent"
              class="p-8 rounded-2xl border border-teal-200 bg-teal-50 flex gap-4 items-start"
            >
              <AppIcon name="checkCircle" :size="28" color="#0D9488" />
              <div>
                <h3 class="text-[18px] font-semibold m-0">Bedankt — bericht ontvangen.</h3>
                <p class="text-sm text-slate-700 mt-1.5 m-0">We bellen of mailen je binnen één werkdag terug.</p>
              </div>
            </div>

            <!-- Form -->
            <form
              v-else
              class="grid grid-cols-2 gap-4 max-w-[560px]"
              @submit.prevent="submit"
            >
              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Naam <span class="text-teal-700">*</span></span>
                <input
                  v-model="form.naam"
                  type="text"
                  placeholder="Anna Janssen"
                  required
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Bedrijf <span class="text-teal-700">*</span></span>
                <input
                  v-model="form.bedrijf"
                  type="text"
                  placeholder="Janssen Techniek BV"
                  required
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">E-mail <span class="text-teal-700">*</span></span>
                <input
                  v-model="form.email"
                  type="email"
                  placeholder="anna@janssen.nl"
                  required
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Telefoon</span>
                <input
                  v-model="form.telefoon"
                  type="tel"
                  placeholder="06 12 34 56 78"
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Aantal medewerkers</span>
                <input
                  v-model="form.medewerkers"
                  type="text"
                  placeholder="bijv. 10–25"
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Huidig systeem</span>
                <input
                  v-model="form.systeem"
                  type="text"
                  placeholder="bijv. Excel, AFAS, Exact"
                  class="h-[46px] px-3.5 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors"
                  style="border-width:1.5px"
                />
              </label>

              <label class="col-span-2 flex flex-col gap-2">
                <span class="text-[13px] font-medium text-slate-700">Waarmee kunnen we helpen?</span>
                <textarea
                  v-model="form.bericht"
                  rows="5"
                  placeholder="Vertel kort waar je tegenaan loopt…"
                  class="px-3.5 py-3 rounded-lg border border-slate-200 bg-white text-[15px] text-slate-900 outline-none focus:border-teal-500 transition-colors resize-y font-sans"
                  style="border-width:1.5px"
                />
              </label>

              <div class="col-span-2 flex gap-3 items-center mt-2">
                <AppButton variant="primary" size="lg" icon-right="arrowRight" type="submit" :style="loading ? 'opacity:.7;pointer-events:none' : ''">
                  {{ loading ? 'Verzenden…' : 'Stuur bericht' }}
                </AppButton>
                <span class="text-[13px] text-slate-500">We bellen binnen 1 werkdag terug.</span>
              </div>
            </form>
          </div>

          <!-- Right: contact info + map -->
          <aside class="flex flex-col gap-4 sticky top-[100px]">
            <div class="p-7 bg-white border border-slate-200 rounded-2xl" style="box-shadow:0 1px 2px rgba(15,23,42,.04)">
              <div class="text-[13px] font-semibold text-teal-700 uppercase tracking-wider mb-4">ByteQ B.V.</div>
              <div class="flex flex-col gap-3.5 text-sm text-slate-700">
                <div class="flex gap-3 items-start">
                  <AppIcon name="mapPin" :size="18" color="#94A3B8" style="margin-top:2px;flex-shrink:0" />
                  <div>
                    Wibautstraat 137c<br />
                    1097 DN Amsterdam<br />
                    Nederland
                  </div>
                </div>
                <div class="flex gap-3 items-center">
                  <AppIcon name="phone" :size="18" color="#94A3B8" style="flex-shrink:0" />
                  <a href="tel:+31201234567" class="text-slate-900 font-medium">+31 (0)20 123 45 67</a>
                </div>
                <div class="flex gap-3 items-center">
                  <AppIcon name="mail" :size="18" color="#94A3B8" style="flex-shrink:0" />
                  <a href="mailto:hallo@maatstap.nl" class="text-slate-900 font-medium">hallo@maatstap.nl</a>
                </div>
              </div>
              <div class="mt-5 pt-4 border-t border-slate-100 text-[13px] text-slate-500">
                Ma–Vr · 09:00–17:30<br />
                KvK 78421490 · BTW NL003421890B01
              </div>
            </div>

            <!-- Map placeholder -->
            <div
              class="rounded-2xl overflow-hidden border border-slate-200 relative bg-slate-100"
              style="aspect-ratio:4/3"
            >
              <svg viewBox="0 0 400 300" width="100%" height="100%" style="display:block">
                <rect width="400" height="300" fill="#F1F5F9" />
                <g stroke="#E2E8F0" stroke-width="14" stroke-linecap="round">
                  <path d="M-20 80 Q 200 100 420 60" />
                  <path d="M-20 220 Q 200 200 420 240" />
                  <path d="M120 -20 Q 140 150 100 320" />
                  <path d="M280 -20 Q 260 160 300 320" />
                </g>
                <g stroke="#fff" stroke-width="6" stroke-linecap="round">
                  <path d="M-20 80 Q 200 100 420 60" />
                  <path d="M-20 220 Q 200 200 420 240" />
                  <path d="M120 -20 Q 140 150 100 320" />
                  <path d="M280 -20 Q 260 160 300 320" />
                </g>
                <g fill="#E2E8F0">
                  <rect x="30" y="110" width="60" height="80" rx="4" />
                  <rect x="160" y="110" width="80" height="40" rx="4" />
                  <rect x="160" y="160" width="80" height="40" rx="4" />
                  <rect x="320" y="100" width="60" height="100" rx="4" />
                </g>
                <path d="M-20 160 Q 200 150 420 160" stroke="#5EEAD4" stroke-width="10" fill="none" opacity="0.5" />
                <g transform="translate(200 150)">
                  <circle r="22" fill="#0d9488" opacity="0.18" />
                  <circle r="14" fill="#0d9488" opacity="0.32" />
                  <circle r="8" fill="#0d9488" stroke="#fff" stroke-width="3" />
                </g>
              </svg>
              <div
                class="absolute bottom-3 left-3 px-3 py-1.5 rounded-lg bg-white text-[12px] font-medium text-slate-700"
                style="box-shadow:0 1px 2px rgba(15,23,42,.04)"
              >
                Wibautstraat, Amsterdam
              </div>
            </div>
          </aside>
        </div>
      </div>
    </main>
    <AppFooter />
  </div>
</template>
