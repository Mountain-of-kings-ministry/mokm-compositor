import { useState } from "react";
import { Database, Zap, Cpu, Film, Share2, Play } from "lucide-react";

const workflowNodes = [
  {
    id: "source",
    icon: Database,
    title: "Media Ingest",
    desc: "Import raw 4K/8K footage directly. MOKM identifies source properties and hardware capabilities.",
    details: ["Support for High-Bitrate H.265/ProRes", "Bit-depth analysis", "Automatic metadata extraction"]
  },
  {
    id: "proxy",
    icon: Zap,
    title: "Proxy Engine",
    desc: "Background worker generates lightweight intra-frame proxies using FFmpeg for silky smooth scrubbing.",
    details: ["Intra-frame only transcoding", "Thread-priority management", "Zero-impact background processing"]
  },
  {
    id: "node",
    icon: Cpu,
    title: "Node Compositor",
    desc: "Visual flow of operations. Connect effects, masks, and color corrections in a non-destructive graph.",
    details: ["GLSL Shader acceleration", "Pull-based lazy evaluation", "ROI (Region of Interest) optimization"]
  },
  {
    id: "render",
    icon: Film,
    title: "Stochastic Preview",
    desc: "Real-time probabilistic rendering provides immediate feedback even on integrated GPUs.",
    details: ["Monte Carlo SPP scaling", "Progressive refinement", "Guided lens sampling"]
  },
  {
    id: "export",
    icon: Play,
    title: "Final Conform",
    desc: "Render output swaps proxies for originals. Professional bit-accurate encoding for delivery.",
    details: ["OCIO/ACES color management", "Multi-pass encoding", "Industrial standard interchange"]
  }
];

export default function Workflow() {
  const [activeNode, setActiveNode] = useState(workflowNodes[0]);

  return (
    <section id="workflow" className="py-24 sm:py-32 bg-surface/50 dark:bg-surface-dark/50 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-3xl sm:text-4xl font-bold tracking-tight mb-4">
            The <span className="text-primary">MOKM Pipeline</span>
          </h2>
          <p className="text-lg text-text-muted dark:text-text-muted-dark max-w-2xl mx-auto">
            A specialized workflow designed to decouple high-resolution data from creative logic,
            enabling professional editing on any hardware.
          </p>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-center">
          {/* Interactive Graph Visualization */}
          <div className="relative flex flex-col items-center">
            <div className="space-y-8 w-full max-w-sm">
              {workflowNodes.map((node, idx) => {
                const Icon = node.icon;
                const isActive = activeNode.id === node.id;
                
                return (
                  <div key={node.id} className="relative">
                    {/* Connection Line */}
                    {idx < workflowNodes.length - 1 && (
                      <div className="absolute left-6 top-14 bottom-[-2rem] w-0.5 bg-gradient-to-b from-primary/30 to-primary/5 dark:from-primary-dark/30 dark:to-primary-dark/5" />
                    )}
                    
                    <button
                      onClick={() => setActiveNode(node)}
                      className={`relative flex items-center gap-6 w-full p-4 rounded-2xl border transition-all duration-300 text-left group
                        ${isActive 
                          ? "bg-panel dark:bg-panel-dark border-primary shadow-studio dark:shadow-studio-dark scale-105" 
                          : "bg-transparent border-border dark:border-border-dark hover:border-primary/50"
                        }`}
                    >
                      <div className={`flex-shrink-0 w-12 h-12 rounded-xl flex items-center justify-center transition-colors
                        ${isActive ? "bg-primary text-white" : "bg-panel dark:bg-panel-dark text-text-muted group-hover:text-primary"}`}>
                        <Icon className="w-6 h-6" />
                      </div>
                      <div>
                        <h3 className={`font-bold transition-colors ${isActive ? "text-primary" : "text-text dark:text-text-dark"}`}>
                          {node.title}
                        </h3>
                        <p className="text-xs text-text-muted dark:text-text-muted-dark truncate max-w-[180px]">
                          {node.desc}
                        </p>
                      </div>
                      
                      {isActive && (
                        <div className="absolute right-4 top-1/2 -translate-y-1/2">
                          <Zap className="w-4 h-4 text-primary animate-pulse" />
                        </div>
                      )}
                    </button>
                  </div>
                );
              })}
            </div>
          </div>

          {/* Node Details Panel */}
          <div className="lg:pl-12">
            <div className="studio-card p-8 lg:p-12 min-h-[400px] flex flex-col justify-center">
              <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 text-primary text-xs font-mono mb-6 uppercase tracking-widest">
                Node ID: {activeNode.id}
              </div>
              <h3 className="text-3xl font-bold mb-4">{activeNode.title}</h3>
              <p className="text-lg text-text-muted dark:text-text-muted-dark mb-8 leading-relaxed">
                {activeNode.desc}
              </p>
              
              <div className="space-y-4">
                <p className="text-[10px] font-mono font-bold uppercase tracking-[0.2em] text-primary/60">Technical Specifications</p>
                <ul className="space-y-3">
                  {activeNode.details.map((detail, idx) => (
                    <li key={idx} className="flex items-center gap-3 text-text dark:text-text-dark font-medium">
                      <div className="w-1.5 h-1.5 rounded-full bg-primary" />
                      <span className="font-mono text-xs">{detail}</span>
                    </li>
                  ))}
                </ul>
              </div>

              <div className="mt-10 pt-8 border-t border-border dark:border-border-dark">
                <div className="flex items-center gap-4 text-primary font-bold">
                  <Share2 className="w-5 h-5" />
                  <span className="text-sm">Industrial Standard Adherence</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
