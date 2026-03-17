/** @type {import('next').NextConfig} */
const nextConfig = {
  transpilePackages: ["@repo/db"], // Aapke DB package ka jo bhi naam hai
  experimental: {
    turbo: {
      resolveAlias: {
        // Ye line Prisma ke missing module ko fix karegi
        "@prisma/client-runtime-utils": "./node_modules/@prisma/client/runtime/library.js",
      },
    },
  },
};

export default nextConfig;
