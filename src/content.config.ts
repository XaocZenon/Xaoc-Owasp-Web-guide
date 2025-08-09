import { defineCollection, z } from 'astro:content';

const terms = defineCollection({
  schema: z.object({
    title: z.string().optional(),
  })
});

export const collections = {
  terms,
};
