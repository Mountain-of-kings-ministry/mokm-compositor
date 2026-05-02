import { CheckCircle2, Circle, Timer } from "lucide-react";

const phases = [
  {
    phase: "01",
    title: "Project Foundation",
    status: "in-progress",
    items: ["Modern C++20 Core Architecture", "FFmpeg decoding & seeking pipeline", "Qt 6 RHI Graphics integration", "Intra-frame proxy generation engine"],
  },
  {
    phase: "02",
    title: "Non-Linear Core",
    status: "planned",
    items: ["Multi-track editorial timeline", "Frame-accurate cutting & trimming", "Asynchronous asset bin management", "Atomic project state (Undo/Redo)"],
  },
  {
    phase: "03",
    title: "Node Compositor",
    status: "planned",
    items: ["DAG (Acyclic Graph) node engine", "GLSL shader execution framework", "Monte Carlo stochastic preview mode", "ROI-based rendering optimization"],
  },
  {
    phase: "04",
    title: "VFX & Finishing",
    status: "planned",
    items: ["Keyframe animation & Bezier curves", "OpenColorIO (OCIO) / ACES pipeline", "OpenFX (OFX) plugin host support", "VST3 / LV2 audio processing suite"],
  },
  {
    phase: "05",
    title: "Vision & Tracking",
    status: "planned",
    items: ["OpenCV-powered planar tracking", "Roto & masking toolset", "AI-assisted segmentation nodes", "Hardware-accelerated conform render"],
  },
];

export default function Roadmap() {
  return (
    <section id="roadmap" className="py-24 sm:py-32 bg-surface/50 dark:bg-surface-dark/50">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-20">
          <h2 className="text-3xl sm:text-4xl font-black tracking-tight mb-4">
            Development <span className="text-primary">Timeline.</span>
          </h2>
          <p className="text-lg text-text-muted dark:text-text-muted-dark">
            Our systematic approach to building a world-class, open-source compositor.
          </p>
        </div>

        <div className="relative">
          {/* Vertical line */}
          <div className="absolute left-8 sm:left-[50%] top-0 bottom-0 w-px bg-border dark:bg-border-dark hidden sm:block" />

          <div className="space-y-12 sm:space-y-0">
            {phases.map((phase, idx) => {
              const isInProgress = phase.status === "in-progress";
              const isEven = idx % 2 === 0;

              return (
                <div key={phase.phase} className={`relative flex flex-col sm:flex-row items-center gap-8 ${isEven ? "sm:flex-row-reverse" : ""}`}>
                  {/* Timeline Dot */}
                  <div className="absolute left-8 sm:left-[50%] -translate-x-1/2 z-10 hidden sm:block">
                    <div className={`w-4 h-4 rounded-full border-4 border-base dark:border-base-dark shadow-sm
                      ${isInProgress ? "bg-primary animate-pulse" : "bg-border dark:bg-border-dark"}`} 
                    />
                  </div>

                  {/* Content Card */}
                  <div className="w-full sm:w-[45%]">
                    <div className="studio-card p-8 hover:border-primary/40">
                      <div className="flex items-center justify-between mb-6">
                        <span className="text-xs font-mono font-bold tracking-[0.3em] text-primary">
                          PHASE {phase.phase}
                        </span>
                        {isInProgress && (
                          <span className="flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-wider">
                            <Timer className="w-3 h-3" />
                            Active
                          </span>
                        )}
                      </div>
                      <h3 className="text-2xl font-black mb-6 text-text dark:text-text-dark tracking-tight">
                        {phase.title}
                      </h3>
                      <ul className="space-y-3">
                        {phase.items.map((item) => (
                          <li key={item} className="flex items-start gap-3 text-sm text-text-muted dark:text-text-muted-dark font-medium">
                            <div className="w-1 h-1 rounded-full bg-primary mt-1.5 flex-shrink-0" />
                            {item}
                          </li>
                        ))}
                      </ul>
                    </div>
                  </div>
                  
                  {/* Spacer for sm+ screens */}
                  <div className="hidden sm:block w-[45%]" />
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </section>
  );
}


