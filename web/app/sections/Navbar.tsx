import { useState } from "react";
import { Menu, X, Clapperboard } from "lucide-react";

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);

  const navLinks = [
    { label: "Features", href: "#features" },
    { label: "Workflow", href: "#workflow" },
    { label: "Proxy", href: "#proxy" },
    { label: "Blueprint", href: "#tech" },
    { label: "Timeline", href: "#roadmap" },
  ];

  return (
    <nav className="glass-nav">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-20">
          {/* Logo */}
          <a href="#" className="flex items-center gap-3 group">
            <div className="w-10 h-10 rounded-xl bg-primary flex items-center justify-center text-white transition-transform group-hover:rotate-6">
              <Clapperboard className="w-6 h-6" />
            </div>
            <span className="text-xl font-black tracking-tighter text-text dark:text-text-dark">
              MOKM<span className="text-primary">.</span>
            </span>
          </a>

          {/* Desktop Nav */}
          <div className="hidden md:flex items-center gap-2">
            {navLinks.map((link) => (
              <a
                key={link.label}
                href={link.href}
                className="px-4 py-2 rounded-full text-[10px] font-mono font-bold uppercase tracking-widest text-text-muted dark:text-text-muted-dark hover:text-primary transition-colors"
              >
                {link.label}
              </a>
            ))}
            <div className="ml-4 w-px h-6 bg-border dark:bg-border-dark" />
            <a
              href="https://github.com/Mountain-of-kings-ministry/mokm-video-editor"
              target="_blank"
              rel="noopener noreferrer"
              className="ml-4 px-6 py-2.5 rounded-full text-xs font-bold bg-primary text-white hover:bg-primary-hover transition-all shadow-md shadow-primary/10"
            >
              Get Started
            </a>
          </div>

          {/* Mobile hamburger */}
          <button
            onClick={() => setIsOpen(!isOpen)}
            className="md:hidden p-2 rounded-xl text-text dark:text-text-dark hover:bg-surface dark:hover:bg-surface-dark"
            aria-label="Toggle menu"
          >
            {isOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>
      </div>

      {/* Mobile menu */}
      {isOpen && (
        <div className="md:hidden border-t border-border dark:border-border-dark bg-base dark:bg-base-dark">
          <div className="px-4 pt-4 pb-8 space-y-2">
            {navLinks.map((link) => (
              <a
                key={link.label}
                href={link.href}
                onClick={() => setIsOpen(false)}
                className="block px-4 py-3 rounded-xl text-xs font-mono font-bold uppercase tracking-widest text-text-muted dark:text-text-muted-dark hover:text-primary hover:bg-surface dark:hover:bg-surface-dark transition-colors"
              >
                {link.label}
              </a>
            ))}
            <a
              href="https://github.com/Mountain-of-kings-ministry/mokm-video-editor"
              target="_blank"
              rel="noopener noreferrer"
              className="block mt-4 px-4 py-4 rounded-xl text-center text-xs font-bold bg-primary text-white"
            >
              Get Started
            </a>
          </div>
        </div>
      )}
    </nav>
  );
}

