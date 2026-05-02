import { Clapperboard, Heart } from "lucide-react";
import { BsGithub, BsTwitterX, BsYoutube } from "react-icons/bs";

export default function Footer() {
  return (
    <footer className="bg-surface dark:bg-surface-dark border-t border-border dark:border-border-dark">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 sm:gap-16">
          {/* Brand Column */}
          <div className="md:col-span-2">
            <a href="#" className="flex items-center gap-3 mb-6 group">
              <div className="w-8 h-8 rounded-lg bg-primary flex items-center justify-center text-white">
                <Clapperboard className="w-5 h-5" />
              </div>
              <span className="text-xl font-black tracking-tighter text-text dark:text-text-dark">
                MOKM<span className="text-primary">.</span>
              </span>
            </a>
            <p className="text-text-muted dark:text-text-muted-dark max-w-sm mb-8 leading-relaxed font-medium">
              Professional node-based compositing for everyone. Open source, 
              proxy-first, and engineered for high-performance creative freedom.
            </p>
            <div className="flex items-center gap-4 text-text-muted dark:text-text-muted-dark">
              <a href="https://github.com/Mountain-of-kings-ministry/mokm-video-editor" className="hover:text-primary transition-colors">
                <BsGithub className="w-5 h-5" />
              </a>
              <a href="#" className="hover:text-primary transition-colors">
                <BsTwitterX className="w-5 h-5" />
              </a>
              <a href="#" className="hover:text-primary transition-colors">
                <BsYoutube className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Links Columns */}
          <div>
            <h4 className="text-[10px] font-mono font-bold uppercase tracking-widest text-primary mb-6">Software</h4>
            <ul className="space-y-4">
              {["Features", "Workflow", "Proxy", "Blueprint", "Timeline"].map((link) => (
                <li key={link}>
                  <a href={`#${link.toLowerCase()}`} className="text-sm font-bold text-text-muted dark:text-text-muted-dark hover:text-primary transition-colors">
                    {link}
                  </a>
                </li>
              ))}
            </ul>
          </div>

          <div>
            <h4 className="text-[10px] font-mono font-bold uppercase tracking-widest text-primary mb-6">Resources</h4>
            <ul className="space-y-4">
              {["Documentation", "API Reference", "OFX SDK", "Community", "Donate"].map((link) => (
                <li key={link}>
                  <a href="#" className="text-sm font-bold text-text-muted dark:text-text-muted-dark hover:text-primary transition-colors">
                    {link}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="mt-16 sm:mt-24 pt-8 border-t border-border dark:border-border-dark flex flex-col sm:flex-row items-center justify-between gap-6">
          <p className="text-[10px] font-mono font-bold uppercase tracking-widest text-text-muted">
            &copy; {new Date().getFullYear()} MOKM VIDEO EDITOR.
          </p>
          
          <div className="flex items-center gap-6">
            <a href="https://www.gnu.org/licenses/gpl-3.0.html" target="_blank" rel="noopener noreferrer" className="text-[10px] font-mono font-bold uppercase tracking-widest text-primary hover:underline">
              GPLv3 LICENSE
            </a>
            <span className="flex items-center gap-2 text-[10px] font-mono font-bold uppercase tracking-widest text-text-muted">
              BUILT WITH <Heart className="w-3 h-3 text-red-500 fill-red-500" /> FOR FLOSS
            </span>
          </div>
        </div>
      </div>
    </footer>
  );
}


