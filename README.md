# ChromicExample

This is a small Elixir application whose goal is to reproduce what has been discussed in [this issue](https://github.com/bitcrowd/chromic_pdf/issues/298).

## Requirements

- Docker

## Steps to reproduce

1. Clone the repo and navigate into its root folder
2. Build the docker image
   
   ```
   $ docker build . -t chromic
   ```

3. Run the container with interactive mode

   ```
   $ docker run -it chromic /bin/bash
   ```

4. Start the `iex` shell

   ```
   $ ./bin/chromic_example start_iex
   ```

5. Run the `test/0` function

   ```
   iex(...) > ChromicExample.test()
   ```

6. See the error raising

   ```
   ** (ChromicPDF.Browser.ExecutionError) Timeout in Channel.run_protocol/3!

      The underlying GenServer.call/3 exited with a timeout. This happens when the browser was
      not able to complete the current operation (= PDF print job) within the configured
      5000 milliseconds.

      If you are printing large PDFs and expect long processing times, please consult the
      documentation for the `timeout` option of the session pool.

      If you are *not* printing large PDFs but your print jobs still time out, this is likely a
      bug in ChromicPDF. Please open an issue on the issue tracker.

      ---

      Current protocol:

      %ChromicPDF.Protocol{
        steps: [
          await: &ChromicPDF.Navigate.page_load_event/2,
          call: &ChromicPDF.PrintToPDF.print_to_pdf/2,
          await: &ChromicPDF.PrintToPDF.printed/2,
          call: &ChromicPDF.ResetTarget.reset_history/2,
          await: &ChromicPDF.ResetTarget.history_reset/2,
          call: &ChromicPDF.ResetTarget.blank/2,
          await: &ChromicPDF.ResetTarget.blanked/2,
          await: &ChromicPDF.ResetTarget.fsl_after_blank/2,
          output: &ChromicPDF.PrintToPDF.output/1
        ],
        state: %{
          :timeout => 5000,
          :name => "[FILTERED]",
          :output => "[FILTERED]",
          :size => 4,
          :__protocol__ => ChromicPDF.PrintToPDF,
          :capture_screenshot => %{},
          :print_to_pdf => %{
            "displayHeaderFooter" => true,
            "footerTemplate" => "[FILTERED]",
            "headerTemplate" => "[FILTERED]",
            "preferCSSPageSize" => true
          },
          :last_call_id => 75,
          :max_uses => "[FILTERED]",
          :checkout_timeout => "[FILTERED]",
          :close_timeout => "[FILTERED]",
          :init_timeout => 5000,
          :disable_scripts => true,
          :ignore_certificate_errors => false,
          :unhandled_runtime_exceptions => :log,
          :offline => true,
          :chrome_args => ["--disable-dev-shm-usage", "--no-sandbox"],
          :discard_stderr => false,
          :on_demand => false,
          :source_type => :html,
          :html => "[FILTERED]",
          :debug_protocol => "[FILTERED]",
          "frameId" => "BF3C558372AB85642B3EDCD67D5BAC1F",
          "sessionId" => "617B75A3F28DEACEE6C98FCF046CE585"
        }
      }

          (chromic_pdf 1.15.2) lib/chromic_pdf/pdf/browser/channel.ex:24: ChromicPDF.Browser.Channel.run_protocol/3
          (chromic_pdf 1.15.2) lib/chromic_pdf/pdf/browser/session_pool.ex:57: anonymous fn/3 in ChromicPDF.Browser.SessionPool.checkout!/3
          (nimble_pool 1.0.0) lib/nimble_pool.ex:349: NimblePool.checkout!/4
          (chromic_pdf 1.15.2) lib/chromic_pdf/pdf/browser/session_pool.ex:54: ChromicPDF.Browser.SessionPool.checkout!/3
          (chromic_pdf 1.15.2) lib/chromic_pdf/api.ex:72: anonymous fn/3 in ChromicPDF.API.chrome_export/4
          (chromic_pdf 1.15.2) lib/chromic_pdf/api/telemetry.ex:10: anonymous fn/2 in ChromicPDF.Telemetry.with_telemetry/3
          (telemetry 1.2.1) /app/deps/telemetry/src/telemetry.erl:321: :telemetry.span/3
          iex:4: (file)
   ```