PHP 8.4 FPM runtime supervisor that rewrites the default systemd service into a self-contained, dependency-free daemon managing the PHP-FPM master, workers, and dynamic pool scaling without external tools like supervisor or systemd.

- Track active requests, worker CPU, memory, and queue depth per pool with sub-second sampling
- Auto-scale worker count up or down based on a simple latency/memory policy with rate limits
- Serve a small status and metrics HTTP endpoint plus log rotation without extra packages
- Support graceful reload, graceful restart, and graceful stop for zero-downtime deployments
- Emit warnings and alerts via structured JSON when pools exhaust slots or workers crash repeatedly
