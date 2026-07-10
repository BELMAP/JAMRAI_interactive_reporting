#
# JAMRAI 2 — One Health AMR/AMC interactive reporting (Shiny app)
#
# Entry point. The app is split by concern so R / HTML(UI) / JS / CSS stay separate:
#
#   src/setup.R         libraries, fonts/icons, ggplot theme
#   src/data.R          load & prepare the AMR data
#   src/text_content.R  editorial / methodology HTML text
#   src/amr_module.R    reusable AMR chart block (filters+switches+slider+D3), a Shiny module
#   src/ui.R            UI: header, sidebar, tabs (defines `ui`) + loadingLogo helper
#   src/server.R        server logic (defines `server`)
#
#   www/amr_d3.js       interactive D3 chart (JavaScript, read server-side by r2d3)
#   www/app.js          page-level JS (loading-logo swap, header subtitle)
#   www/style2_2.css    styles
#
# Run with the "Run App" button, or shiny::runApp().

# Sourced in dependency order (setup → data/text → module → ui → server).
source("src/setup.R")
source("src/data.R")
source("src/text_content.R")
source("src/amr_module.R")
source("src/ui.R")
source("src/server.R")

# Run the application
shinyApp(ui = ui, server = server)
