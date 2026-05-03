<script setup lang="ts">
const columns = [
  { title: 'Product',   links: [['Functies','#'],['Modules','#'],['Prijzen','/pricing'],['Roadmap','#'],['Wat is nieuw','#']] },
  { title: 'Bedrijf',   links: [['Over ons','#'],['Klanten','#'],['Vacatures','#'],['Contact','/contact']] },
  { title: 'Resources', links: [['Documentatie','#'],['API-referentie','#'],['Helpcentrum','#'],['Status','#']] },
  { title: 'Juridisch', links: [['Privacy','#'],['Voorwaarden','#'],['Verwerker','#'],['Beveiliging','#']] },
]
const socials = ['twitter', 'linkedin', 'github']
</script>

<template>
  <footer class="bg-slate-50 border-t border-slate-100 pt-16 pb-10 mt-20">
    <div class="ms-container">
      <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-[1.4fr_1fr_1fr_1fr_1fr] gap-10 mb-14">
        <!-- Brand -->
        <div class="col-span-2 md:col-span-3 lg:col-span-1">
          <AppLogo :size="26" />
          <p class="text-sm text-slate-600 mt-3.5 leading-relaxed max-w-[280px]">
            Een ERP-platform op maat voor productie- en groothandelsbedrijven. Gebouwd in Nederland.
          </p>
          <div class="flex gap-2 mt-5">
            <a v-for="n in socials" :key="n" href="#"
              class="w-9 h-9 rounded-lg bg-white border border-slate-200 inline-flex items-center justify-center text-slate-600 hover:border-slate-300 transition-colors">
              <AppIcon :name="n" :size="16" />
            </a>
          </div>
        </div>

        <div v-for="col in columns" :key="col.title">
          <div class="text-[13px] font-semibold text-slate-900 mb-4 uppercase tracking-wider">{{ col.title }}</div>
          <div class="flex flex-col gap-3">
            <NuxtLink v-for="[label, href] in col.links" :key="label" :to="href"
              class="text-sm text-slate-600 hover:text-slate-900 transition-colors">{{ label }}</NuxtLink>
          </div>
        </div>
      </div>

      <div class="pt-7 border-t border-slate-200 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-3">
        <div class="text-[13px] text-slate-500">© 2026 ByteQ B.V. · KvK 78421490 · Werk op maat.</div>
        <div class="text-[13px] text-slate-500 flex gap-4">
          <span>🇳🇱 Nederlands</span>
          <span>Servers in Amsterdam</span>
        </div>
      </div>
    </div>
  </footer>
</template>
