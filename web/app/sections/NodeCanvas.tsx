import { useEffect, useRef, useState } from "react";

interface Node {
  id: number;
  x: number;
  y: number;
  vx: number;
  vy: number;
  size: number;
}

export default function NodeCanvas() {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [nodes, setNodes] = useState<Node[]>([]);
  const mouse = useRef({ x: -1000, y: -1000 });

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;

    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const updateSize = () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    };

    window.addEventListener("resize", updateSize);
    updateSize();

    // Initialize nodes
    const nodeCount = Math.floor((canvas.width * canvas.height) / 40000);
    const initialNodes: Node[] = Array.from({ length: nodeCount }).map((_, i) => ({
      id: i,
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      vx: (Math.random() - 0.5) * 0.5,
      vy: (Math.random() - 0.5) * 0.5,
      size: Math.random() * 2 + 1,
    }));
    setNodes(initialNodes);

    const handleMouseMove = (e: MouseEvent) => {
      mouse.current = { x: e.clientX, y: e.clientY };
    };

    window.addEventListener("mousemove", handleMouseMove);

    let animationFrameId: number;

    const render = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      const isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
      const lineColor = "rgba(212, 160, 23, 0.15)";
      const nodeColor = "rgba(212, 160, 23, 0.4)";

      initialNodes.forEach((node, i) => {
        // Apply velocity
        node.x += node.vx;
        node.y += node.vy;

        // Bounce off edges
        if (node.x < 0 || node.x > canvas.width) node.vx *= -1;
        if (node.y < 0 || node.y > canvas.height) node.vy *= -1;

        // Interaction with mouse
        const dx = mouse.current.x - node.x;
        const dy = mouse.current.y - node.y;
        const dist = Math.sqrt(dx * dx + dy * dy);
        if (dist < 200) {
          node.x -= dx * 0.01;
          node.y -= dy * 0.01;
        }

        // Draw node
        ctx.beginPath();
        ctx.arc(node.x, node.y, node.size, 0, Math.PI * 2);
        ctx.fillStyle = nodeColor;
        ctx.fill();

        // Draw connections
        for (let j = i + 1; j < initialNodes.length; j++) {
          const other = initialNodes[j];
          const distance = Math.sqrt((node.x - other.x) ** 2 + (node.y - other.y) ** 2);

          if (distance < 150) {
            ctx.beginPath();
            ctx.moveTo(node.x, node.y);
            ctx.lineTo(other.x, other.y);
            ctx.strokeStyle = lineColor;
            ctx.lineWidth = 1 - distance / 150;
            ctx.stroke();
          }
        }
      });

      animationFrameId = requestAnimationFrame(render);
    };

    render();

    return () => {
      window.removeEventListener("resize", updateSize);
      window.removeEventListener("mousemove", handleMouseMove);
      cancelAnimationFrame(animationFrameId);
    };
  }, []);

  return (
    <canvas
      ref={canvasRef}
      className="absolute inset-0 pointer-events-none opacity-60"
      style={{ zIndex: 0 }}
    />
  );
}
