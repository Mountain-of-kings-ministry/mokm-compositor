const technologies = [
  { name: "C++20", category: "Core" },
  { name: "Qt 6.8", label: "RHI Architecture", category: "UI/UX" },
  { name: "FFmpeg", label: "Media I/O", category: "Engine" },
  { name: "OpenColorIO", label: "ACES Pipeline", category: "Color" },
  { name: "OpenTimelineIO", label: "Interchange", category: "Editorial" },
  { name: "OpenCV", label: "Vision Processing", category: "Vision" },
  { name: "Vulkan", label: "Cross-Platform", category: "Graphics" },
  { name: "SQLite", label: "Project DB", category: "Storage" },
  { name: "OpenFX", label: "Plugin API", category: "VFX" },
  { name: "VST3 / LV2", label: "Audio Logic", category: "Audio" },
];

export default function TechStack() {
  return (
    <section id="tech" className="py-24 sm:py-32">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-16">
          <h2 className="text-3xl sm:text-4xl font-black tracking-tight mb-4">
            Industrial <span className="text-primary">Foundations.</span>
          </h2>
          <p className="text-lg text-text-muted dark:text-text-muted-dark max-w-2xl">
            MOKM is built on the same foundations as the world&apos;s leading VFX suites. 
            We leverage open standards to ensure maximum interoperability and precision.
          </p>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
          {technologies.map((tech) => (
            <div
              key={tech.name}
              className="studio-card p-6 flex flex-col justify-between hover:border-primary/50 transition-colors"
            >
              <div>
                <span className="text-[9px] font-mono font-bold uppercase tracking-[0.2em] text-primary/60 mb-2 block">
                  {tech.category}
                </span>
                <h3 className="text-lg font-bold text-text dark:text-text-dark font-mono">
                  {tech.name}
                </h3>
              </div>
              <p className="text-xs text-text-muted dark:text-text-muted-dark mt-4 font-medium uppercase tracking-wider">
                {tech.label || "Framework"}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}


