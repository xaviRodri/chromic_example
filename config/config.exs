import Config

config :chromic_example, ChromicPDF,
  chrome_args: ["--disable-dev-shm-usage", "--no-sandbox"],
  debug_protocol: true,
  disable_scripts: true,
  discard_stderr: false,
  offline: true,
  on_demand: false
