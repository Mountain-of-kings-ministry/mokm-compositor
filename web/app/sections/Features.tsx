import { Network, Film, Plug, Layers, Palette, ScanEye, Cpu, Monitor } from "lucide-react";

const bentoFeatures = [
  {
    icon: Network,
    title: "Node-Based Compositing",
    description: "Build complex visual effects with a high-performance DAG (Directed Acyclic Graph). Pull-based lazy evaluation ensures only the required pixels are processed.",
    className: "lg:col-span-2 lg:row-span-2",
    tag: "Core Engine"
  },
  {
    icon: Film,
    title: "Proxy-First Architecture",
    description: "Decouple creative logic from high-res media. Edit 4K/8K effortlessly on standard laptops.",
    className: "lg:col-span-2",
    tag: "Performance"
  },
  {
    icon: Cpu,
    title: "Hardware Accelerated",
    description: "Zero-copy GPU pipelines and SIMD optimizations for real-time responsiveness.",
    className: "lg:col-span-1",
    tag: "Optimization"
  },
  {
    icon: Plug,
    title: "Plugin Ecosystem",
    description: "Native support for OpenFX (OFX), VST3, and LV2 industrial standard plugins.",
    className: "lg:col-span-1",
    tag: "Extensible"
  },
  {
    icon: Palette,
    title: "Cinema Grade Color",
    description: "Mathematically correct color science with OpenColorIO (OCIO) and ACES support.",
    className: "lg:col-span-2",
    tag: "Color Science"
  },
  {
    icon: ScanEye,
    title: "Intelligent Analysis",
    description: "Built-in motion tracking and computer vision tools powered by OpenCV integration.",
    className: "lg:col-span-1",
    tag: "Vision"
  },
  {
    icon: Monitor,
    title: "Platform Native",
    description: "High-performance builds for Linux, Windows, and macOS using Qt 6 RHI.",
    className: "lg:col-span-1",
    tag: "Cross-Platform"
  }
];

export default function Features() {
  return (
    <section id="features" className="py-24 sm:py-32 relative">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="max-w-3xl mb-16">
          <h2 className="text-3xl sm:text-4xl font-black tracking-tight mb-4">
            Engineered for <span className="text-primary">Extreme Performance.</span>
          </h2>
          <p className="text-lg text-text-muted dark:text-text-muted-dark leading-relaxed">
            MOKM isn&apos;t just another video editor. It&apos;s a technical breakthrough in how 
            digital media is processed, designed specifically for resource-constrained environments.
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 auto-rows-[minmax(180px,auto)]">
          {bentoFeatures.map((feature) => {
            const Icon = feature.icon;
            return (
              <div
                key={feature.title}
                className={`studio-card p-8 group flex flex-col justify-between hover:border-primary/50 transition-colors ${feature.className}`}
              >
                <div>
                  <div className="flex items-center justify-between mb-6">
                    <div className="w-12 h-12 rounded-2xl bg-primary/10 flex items-center justify-center text-primary group-hover:scale-110 transition-transform">
                      <Icon className="w-6 h-6" />
                    </div>
                    <span className="text-[10px] font-mono font-bold uppercase tracking-widest text-primary/60">
                      {feature.tag}
                    </span>
                  </div>
                  <h3 className="text-xl font-bold mb-3 text-text dark:text-text-dark">
                    {feature.title}
                  </h3>
                  <p className="text-sm text-text-muted dark:text-text-muted-dark leading-relaxed">
                    {feature.description}
                  </p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}


