/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone', // Enable standalone output mode to optimize container deployment
  experimental: {
    outputFileTracingRoot: undefined, // Ensure correct dependency tracing
  },
}

export default nextConfig