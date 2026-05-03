/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './components/**/*.{vue,js,ts}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './app.vue',
    './nuxt.config.{js,ts}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Geist', 'Inter', '-apple-system', 'system-ui', 'sans-serif'],
        display: ['Instrument Serif', 'Times New Roman', 'serif'],
        mono: ['JetBrains Mono', 'ui-monospace', 'monospace'],
      },
      colors: {
        teal: {
          50:  '#F0FDFA',
          100: '#CCFBF1',
          200: '#99F6E4',
          300: '#5EEAD4',
          400: '#2DD4BF',
          500: '#14B8A6',
          600: '#0D9488',
          700: '#0F766E',
          800: '#115E59',
          900: '#134E4A',
        },
        slate: {
          50:  '#F8FAFC',
          100: '#F1F5F9',
          200: '#E2E8F0',
          300: '#CBD5E1',
          400: '#94A3B8',
          500: '#64748B',
          600: '#475569',
          700: '#334155',
          800: '#1E293B',
          900: '#0F172A',
        },
      },
      borderRadius: {
        sm: '6px',
        DEFAULT: '10px',
        md: '10px',
        lg: '14px',
        xl: '20px',
        '2xl': '28px',
        '3xl': '32px',
        full: '9999px',
      },
      boxShadow: {
        sm: '0 1px 2px rgba(15,23,42,.04), 0 1px 0 rgba(15,23,42,.02)',
        md: '0 4px 8px -2px rgba(15,23,42,.06), 0 8px 24px -8px rgba(15,23,42,.08)',
        lg: '0 12px 32px -8px rgba(15,23,42,.12), 0 4px 12px -2px rgba(15,23,42,.06)',
        xl: '0 24px 48px -12px rgba(15,23,42,.18), 0 8px 16px -4px rgba(15,23,42,.08)',
        glow: '0 20px 60px -20px rgba(13,148,136,.35)',
      },
      letterSpacing: {
        tighter: '-0.045em',
        tight: '-0.03em',
        snug: '-0.02em',
        normal: '-0.005em',
        wide: '0.04em',
        wider: '0.05em',
        widest: '0.06em',
      },
      animation: {
        'marquee': 'marquee 40s linear infinite',
        'spin-slow': 'spin-slow 30s linear infinite',
        'bob': 'bob 4s ease-in-out infinite',
      },
      keyframes: {
        marquee: {
          '0%': { transform: 'translateX(0)' },
          '100%': { transform: 'translateX(-50%)' },
        },
        'spin-slow': {
          to: { transform: 'rotate(360deg)' },
        },
        bob: {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-6px)' },
        },
      },
      maxWidth: {
        container: '1200px',
      },
    },
  },
  plugins: [],
}
