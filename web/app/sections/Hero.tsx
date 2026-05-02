import { ArrowRight } from "lucide-react";
import NodeCanvas from "./NodeCanvas";
import { BsGithub } from "react-icons/bs";

export default function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-base-dark">
      {/* 1. Base Layer: Abstract Cinematic Background */}
      <div 
        className="absolute inset-0 opacity-40 grayscale"
        style={{
          backgroundImage: `url('https://images.unsplash.com/photo-1635830325697-4235feb9e043?q=80&w=2070&auto=format&fit=crop')`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }}
      />

      {/* 2. Middle Layer: Viewport Grid & UI Frame */}
      <div className="absolute inset-0 viewport-grid opacity-20 pointer-events-none" />
      
      {/* 3. Interactive Layer: Node Graph UI */}
      <NodeCanvas />

      {/* 4. Effect Layers: Grain, Scanlines, Vignette */}
      <div className="absolute inset-0 bg-grain opacity-[0.03] pointer-events-none" />
      <div className="absolute inset-0 scanlines opacity-40 pointer-events-none" />
      <div className="absolute inset-0 vignette pointer-events-none" />

      {/* 5. Content Overlay */}
      <div className="relative z-10 max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <div className="inline-flex items-center gap-3 px-4 py-1.5 rounded-full comp-border bg-black/40 backdrop-blur-md mb-10">
          <span className="relative flex h-2 w-2">
            <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary opacity-75" />
            <span className="relative inline-flex rounded-full h-2 w-2 bg-primary" />
          </span>
          <span className="text-[10px] font-mono font-bold tracking-[0.3em] text-primary uppercase">
            System State: Composite Alpha
          </span>
        </div>

        <h1 className="text-5xl sm:text-8xl font-black tracking-tighter text-white leading-[0.85] mb-10 drop-shadow-2xl">
          Cinema Grade <br />
          <span className="text-primary">Logic.</span>
        </h1>

        <p className="text-lg sm:text-2xl text-slate-300 max-w-2xl mx-auto mb-14 leading-relaxed font-medium">
          MOKM is an industrial-standard node compositor designed for high-performance 
          visual effects on any hardware. Redefining what open-source can achieve.
        </p>

        <div className="flex flex-col sm:flex-row items-center justify-center gap-6 mb-24">
          <a
            href="#features"
            className="group flex items-center gap-4 px-12 py-5 rounded-full text-base font-bold bg-primary text-black hover:scale-105 transition-all shadow-2xl shadow-primary/30"
          >
            Enter Studio
            <ArrowRight className="w-5 h-5 transition-transform group-hover:translate-x-1" />
          </a>
          <a
            href="https://github.com/Mountain-of-kings-ministry/mokm-video-editor"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-4 px-12 py-5 rounded-full text-base font-bold bg-white/10 backdrop-blur-xl border border-white/20 text-white hover:bg-white/20 transition-all"
          >
            <BsGithub className="w-6 h-6" />
            Forge Path
          </a>
        </div>

        {/* Compositor Metadata */}
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-12 max-w-4xl mx-auto border-t border-white/10 pt-12">
          {[
            { value: "0.1.0-α", label: "Build Version" },
            { value: "FLOAT32", label: "Bit Depth" },
            { value: "ACEScg", label: "Color Space" },
            { value: "60 FPS", label: "Target UI" },
          ].map((stat) => (
            <div key={stat.label} className="text-center">
              <div className="text-xl sm:text-2xl font-mono font-bold text-white drop-shadow-md">
                {stat.value}
              </div>
              <div className="text-[10px] text-primary/60 mt-1 font-bold uppercase tracking-[0.2em]">
                {stat.label}
              </div>
            </div>
          ))}
        </div>
      </div>
      
      {/* Sidebar UI Decorations (Visual only) */}
      <div className="absolute left-8 top-1/2 -translate-y-1/2 hidden xl:flex flex-col gap-8 opacity-20 pointer-events-none">
        {Array.from({ length: 12 }).map((_, i) => (
          <div key={i} className="w-6 h-1 bg-white" />
        ))}
      </div>
      <div className="absolute right-8 top-1/2 -translate-y-1/2 hidden xl:flex flex-col gap-8 opacity-20 pointer-events-none">
        {Array.from({ length: 12 }).map((_, i) => (
          <div key={i} className="w-1 h-6 bg-white" />
        ))}
      </div>
    </section>
  );
}


