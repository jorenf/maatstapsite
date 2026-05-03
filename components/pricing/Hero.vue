<script setup lang="ts">
defineProps<{
  annual: boolean
}>()

const emit = defineEmits<{
  (e: 'update:annual', value: boolean): void
}>()
</script>

<template>
  <section
    class="pt-20 pb-10 text-center"
    style="background:linear-gradient(180deg,#F0FDFA,transparent)"
  >
    <div class="ms-container">
      <div class="flex justify-center mb-4">
        <AppEyebrow>Prijzen</AppEyebrow>
      </div>
      <h1
        class="font-semibold m-0 leading-[1.05]"
        style="font-size:clamp(40px,5.5vw,64px);letter-spacing:-0.03em"
      >
        Eerlijke prijzen.<br />
        <span class="text-slate-500">Geen verrassingen.</span>
      </h1>
      <p class="text-[19px] text-slate-600 max-w-[560px] mx-auto mt-5 mb-9 leading-relaxed">
        Maandelijks opzegbaar. Eerste 14 dagen gratis. Krijg twee maanden cadeau bij een jaarabonnement.
      </p>

      <!-- Toggle -->
      <div
        class="inline-flex p-1 bg-white rounded-full border border-slate-200"
        style="box-shadow:0 1px 2px rgba(15,23,42,.04)"
      >
        <button
          v-for="[label, val] in [['Maandelijks', false], ['Jaarlijks', true]]"
          :key="String(label)"
          class="px-6 py-2.5 rounded-full border-none cursor-pointer text-sm font-medium transition-all"
          :style="{
            background: annual === val ? '#0F172A' : 'transparent',
            color: annual === val ? '#fff' : '#475569',
          }"
          @click="emit('update:annual', val as boolean)"
        >
          {{ label }}
          <span
            v-if="val"
            class="ml-2 text-[11px] px-2 py-0.5 rounded-full"
            :style="{
              background: annual ? '#14B8A6' : '#CCFBF1',
              color: annual ? '#fff' : '#0F766E',
            }"
          >−17%</span>
        </button>
      </div>
    </div>
  </section>
</template>
