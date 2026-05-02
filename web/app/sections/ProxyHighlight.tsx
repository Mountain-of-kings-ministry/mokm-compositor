import { Zap, MonitorOff, Activity, ShieldCheck } from "lucide-react";

const steps = [
  {
    icon: MonitorOff,
    title: "Smart Ingest",
    desc: "MOKM analyzes your hardware I/O and CPU overhead to suggest the optimal proxy workflow.",
  },
  {
    icon: Activity,
    title: "Intra-frame Transcoding",
    desc: "Background conversion to ProRes Proxy or DNxHR LB ensures instant scrubbing without CPU lag.",
  },
  {
    icon: Zap,
    title: "Dual-Pointer Logic",
    desc: "The timeline uses low-res copies for logic, but keeps a bit-accurate link to original high-res data.",
  },
  {
    icon: ShieldCheck,
    title: "Final Conform",
    desc: "The render engine only touches original data during the final output, ensuring 100% fidelity.",
  },
];

export default function ProxyHighlight() {
  return (
    <section id="proxy" className="py-24 sm:py-32 bg-surface/30 dark:bg-surface-dark/30 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid lg:grid-cols-2 gap-20 items-center">
          {/* Left: Content */}
          <div>
            <div className="inline-flex items-center gap-3 px-3 py-1 rounded-full bg-primary/10 text-primary mb-8">
              <Zap className="w-4 h-4" />
              <span className="text-[10px] font-mono font-bold uppercase tracking-widest">Philosophy</span>
            </div>
            <h2 className="text-4xl sm:text-5xl font-black tracking-tight mb-8">
              Decouple <span className="text-primary">Data</span> <br /> from <span className="text-primary">Logic.</span>
            </h2>
            <p className="text-xl text-text-muted dark:text-text-muted-dark mb-12 leading-relaxed font-medium">
              We believe hardware shouldn&apos;t be a prerequisite for professional visual storytelling. 
              Our proxy-first architecture makes 4K editing viable on systems with as little as 4GB of RAM.
            </p>

            {/* Comparison Table */}
            <div className="space-y-4">
              {[
                { label: "Original Source", value: "4K 10-bit H.265", perf: "System Stalling", color: "bg-red-500" },
                { label: "MOKM Proxy", value: "720p 8-bit ProRes", perf: "60 FPS Scrubbing", color: "bg-primary" },
              ].map((comp) => (
                <div key={comp.label} className="studio-card p-5 flex items-center justify-between group hover:border-primary/30">
                  <div className="flex items-center gap-4">
                    <div className={`w-1.5 h-1.5 rounded-full ${comp.color}`} />
                    <div>
                      <p className="text-[10px] font-mono font-bold uppercase tracking-widest text-text-muted">{comp.label}</p>
                      <p className="text-lg font-bold">{comp.value}</p>
                    </div>
                  </div>
                  <div className="text-right">
                    <p className="text-[10px] font-mono font-bold uppercase tracking-widest text-text-muted">Performance</p>
                    <p className={`text-sm font-bold ${comp.color === "bg-primary" ? "text-primary" : "text-red-500"}`}>{comp.perf}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Right: Step flow */}
          <div className="grid gap-6">
            {steps.map((step, idx) => {
              const Icon = step.icon;
              return (
                <div key={step.title} className="studio-card p-6 flex gap-6 group hover:border-primary/50">
                  <div className="flex-shrink-0">
                    <div className="w-14 h-14 rounded-2xl bg-surface dark:bg-surface-dark border border-border dark:border-border-dark flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-all">
                      <Icon className="w-7 h-7" />
                    </div>
                  </div>
                  <div>
                    <h3 className="text-xl font-bold mb-2 flex items-center gap-3">
                      <span className="text-xs font-mono text-primary/40">0{idx + 1}</span>
                      {step.title}
                    </h3>
                    <p className="text-sm text-text-muted dark:text-text-muted-dark leading-relaxed">
                      {step.desc}
                    </p>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </section>
  );
}


