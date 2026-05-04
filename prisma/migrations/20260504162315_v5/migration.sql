-- AlterEnum
ALTER TYPE "Videostatus" ADD VALUE 'PENDING';

-- AlterTable
ALTER TABLE "uploads" ALTER COLUMN "status" SET DEFAULT 'PENDING';
