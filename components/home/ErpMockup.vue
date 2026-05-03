<script setup lang="ts">
const kpis = [
  { label: 'Omzet deze maand', value: '€ 248K', delta: '+12%', positive: true },
  { label: 'Open offertes', value: '12', delta: '€ 184K', positive: false },
  { label: 'Marge gem.', value: '29%', delta: '+1.2pp', positive: true },
  { label: 'Te leveren', value: '6', delta: 'Deze week', positive: false },
]

const navItems = [
  { icon: 'trendUp', label: 'Dashboard', active: true },
  { icon: 'fileText', label: 'Offertes', badge: 12 },
  { icon: 'package', label: 'Orders', badge: 4 },
  { icon: 'users', label: 'Klanten' },
  { icon: 'blocks', label: 'Artikelen' },
  { icon: 'sliders', label: 'Configurator' },
]

const quotes = [
  { n: 'OFF-2026-0148', k: 'Jansen Tech.', b: '€ 12.4K', status: 'open', label: 'Open' },
  { n: 'OFF-2026-0147', k: 'Bouwgroep Nrd', b: '€ 42.8K', status: 'open', label: 'Open' },
  { n: 'OFF-2026-0146', k: 'Havens Infra', b: '€ 8.6K', status: 'won', label: 'Akkoord' },
  { n: 'OFF-2026-0145', k: 'De Vries', b: '€ 18.2K', status: 'won', label: 'Akkoord' },
  { n: 'OFF-2026-0144', k: 'Meurs KS', b: '€ 4.9K', status: 'won', label: 'Akkoord' },
]

const chartPath = 'M 20 160 L 70 130 L 120 145 L 170 100 L 220 110 L 270 80 L 320 90 L 370 60 L 420 75 L 470 50 L 520 65 L 580 35'
const areaPath = chartPath + ' L 580 200 L 20 200 Z'
const dots = [20,70,120,170,220,270,320,370,420,470,520,580]
const dotY = [160,130,145,100,110,80,90,60,75,50,65,35]
</script>

<template>
  <div
    class="bg-white rounded-xl border border-slate-200 overflow-hidden"
    style="width:1100px;height:680px;box-shadow:0 24px 48px -12px rgba(15,23,42,.18),0 8px 16px -4px rgba(15,23,42,.08);font-family:'Inter',system-ui,sans-serif"
  >
    <!-- Browser chrome -->
    <div class="h-[38px] bg-slate-50 border-b border-slate-200 flex items-center px-3.5 gap-2">
      <span class="w-[11px] h-[11px] rounded-full bg-[#FF5F57]" />
      <span class="w-[11px] h-[11px] rounded-full bg-[#FEBC2E]" />
      <span class="w-[11px] h-[11px] rounded-full bg-[#28C840]" />
      <div class="flex-1 ml-3.5 h-[22px] bg-white rounded-md border border-slate-200 flex items-center px-2.5 text-[11px] text-slate-500">
        app.maatstap.nl/dashboard
      </div>
    </div>

    <div class="flex" style="height:calc(100% - 38px)">
      <!-- Sidebar -->
      <aside class="w-[220px] bg-white border-r border-slate-100 p-3.5 flex flex-col gap-1">
        <div class="px-2 pb-4 pt-1">
          <AppLogo :size="22" />
        </div>

        <div
          v-for="item in navItems"
          :key="item.label"
          class="flex items-center gap-2.5 px-2.5 py-[9px] rounded-[7px]"
          :style="{
            background: item.active ? '#F0FDFA' : 'transparent',
            color: item.active ? '#0F766E' : '#475569',
            fontSize: '13px',
            fontWeight: item.active ? 600 : 500,
          }"
        >
          <AppIcon :name="item.icon" :size="16" :color="item.active ? '#0D9488' : '#94A3B8'" />
          <span class="flex-1">{{ item.label }}</span>
          <span
            v-if="item.badge"
            class="text-[10px] font-semibold bg-slate-100 text-slate-600 rounded-full px-1.5 min-w-[18px] h-[18px] inline-flex items-center justify-center"
          >{{ item.badge }}</span>
        </div>

        <div class="flex-1" />

        <div class="p-2.5 flex items-center gap-2.5 border-t border-slate-100 mt-2">
          <span class="w-[30px] h-[30px] rounded-full bg-teal-700 text-white inline-flex items-center justify-center text-[11px] font-semibold">MV</span>
          <div class="text-[12px]">
            <div class="font-semibold">Martijn V.</div>
            <div class="text-slate-500 text-[11px]">Kunststof BV</div>
          </div>
        </div>
      </aside>

      <!-- Main -->
      <main class="flex-1 p-6 overflow-hidden bg-[#FCFCFD]">
        <div class="flex items-baseline gap-3 mb-1">
          <h1 class="text-[22px] font-semibold tracking-snug m-0">Goedemiddag, Martijn</h1>
          <span class="text-[12px] text-slate-500">Donderdag 30 oktober 2026</span>
        </div>
        <p class="text-[13px] text-slate-600 mb-4">Je hebt 3 offertes die vandaag verlopen.</p>

        <!-- KPIs -->
        <div class="grid grid-cols-4 gap-2.5 mb-5">
          <div
            v-for="k in kpis"
            :key="k.label"
            class="bg-white border border-slate-200 rounded-lg p-3"
          >
            <div class="text-[11px] text-slate-500 font-medium">{{ k.label }}</div>
            <div class="text-[22px] font-semibold tracking-snug mt-0.5">{{ k.value }}</div>
            <div class="text-[11px] font-medium mt-0.5" :class="k.positive ? 'text-teal-700' : 'text-slate-500'">{{ k.delta }}</div>
          </div>
        </div>

        <!-- Chart + table -->
        <div class="grid gap-3.5" style="grid-template-columns:1.5fr 1fr">
          <div class="bg-white border border-slate-200 rounded-lg p-4">
            <div class="flex justify-between mb-3">
              <div class="text-[13px] font-semibold">Omzet · laatste 12 weken</div>
              <span class="text-[11px] text-slate-500">EUR ×1000</span>
            </div>
            <svg viewBox="0 0 600 220" style="width:100%;height:220px">
              <defs>
                <linearGradient id="area-grad" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="0%" stop-color="#0d9488" stop-opacity="0.25" />
                  <stop offset="100%" stop-color="#0d9488" stop-opacity="0" />
                </linearGradient>
              </defs>
              <line v-for="i in 4" :key="i" x1="20" :y1="30+(i-1)*50" x2="590" :y2="30+(i-1)*50" stroke="#E2E8F0" stroke-dasharray="3 4" />
              <path :d="areaPath" fill="url(#area-grad)" />
              <path :d="chartPath" fill="none" stroke="#0d9488" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
              <circle v-for="(x, i) in dots" :key="i" :cx="x" :cy="dotY[i]" r="2.5" fill="#0d9488" stroke="#fff" stroke-width="1.5" />
            </svg>
          </div>

          <div class="bg-white border border-slate-200 rounded-lg overflow-hidden">
            <div class="px-4 py-[13px] border-b border-slate-100 text-[13px] font-semibold">Recente offertes</div>
            <div
              v-for="(r, i) in quotes"
              :key="r.n"
              class="px-4 py-[11px] flex items-center gap-2.5 text-[12px]"
              :class="i < 4 ? 'border-b border-slate-100' : ''"
            >
              <div class="flex-1 min-w-0">
                <div class="font-semibold font-mono text-[11px]">{{ r.n }}</div>
                <div class="text-slate-600 text-[11px]">{{ r.k }}</div>
              </div>
              <div class="font-semibold tabular-nums">{{ r.b }}</div>
              <span
                class="px-2 py-0.5 rounded-[5px] text-[10px] font-semibold"
                :class="r.status === 'won' ? 'bg-teal-50 text-teal-700' : 'bg-amber-50 text-amber-800'"
              >{{ r.label }}</span>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>
