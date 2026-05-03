<script setup lang="ts">
withDefaults(defineProps<{
  eyebrow?: string
  align?: 'left' | 'center'
}>(), {
  align: 'left',
})
</script>

<template>
  <div
    :class="[
      align === 'center' ? 'text-center mx-auto' : '',
    ]"
    :style="align === 'center' ? 'max-width: 720px' : ''"
  >
    <div v-if="eyebrow" :class="['mb-4', align === 'center' ? 'flex justify-center' : '']">
      <AppEyebrow>{{ eyebrow }}</AppEyebrow>
    </div>
    <h2 class="text-[clamp(32px,4.5vw,48px)] font-semibold tracking-tight leading-[1.1] m-0">
      <slot name="title" />
    </h2>
    <p v-if="$slots.sub" class="text-[19px] text-slate-600 mt-4 leading-relaxed m-0">
      <slot name="sub" />
    </p>
  </div>
</template>
