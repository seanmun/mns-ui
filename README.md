# mns-ui

The MNS Fantasy design system: tokens (Chalk light + platform dark),
theme switching, and the shared component library. Source of truth for
every app's UI; `sync.sh` copies `src/` into each repo's `src/ui/`.

Rules: components own accessibility (18px base, 3rem targets, measured
AA contrast, visible focus, no color-only state). Pages compose; they
do not restyle.
