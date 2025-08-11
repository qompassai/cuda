<!-- /qompassai/cuda/dkms/README.md -->
<!-- Qompass AI CUDA DKMS -->
<!-- Copyright (C) 2025 Qompass AI, All rights reserved -->
<!-- ---------------------------------------- -->

<h1 align="center">Dynamic Kernel Module Support (DKMS)</h1>

<details>
  <summary style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
    <strong>nvidia</strong>
  </summary>
  <div style="background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 10px; font-family: monospace;">

Parameter                                     | Type   | Possible Values                       | Description                                             | Documentation
----------------------------------------------|--------|---------------------------------------|---------------------------------------------------------|--------------
NvSwitchRegDwords                             | charp  | comma-separated key-value string       | Register settings for NvSwitch device.                  | NVIDIA NvSwitch UG
NvSwitchBlacklist                             | charp  | uuid[,uuid...] (list of UUIDs)        | UUIDs of NvSwitches to blacklist.                       | NVIDIA Driver UG
NVreg_ResmanDebugLevel                        | int    | 0-10                                  | Debug verbosity for RM.                                 | NVIDIA Driver UG, RM params
NVreg_RmLogonRC                               | int    | 0,1                                   | Resource Manager logon RC.                              | NVIDIA Driver UG
NVreg_ModifyDeviceFiles                       | int    | 0,1                                   | Whether to modify device file permissions.              | NVIDIA Kernel Module PG
NVreg_DeviceFileUID                           | int    | UID integer (e.g. 0-65535)            | UID for nvidia device files.                            | NVIDIA Kernel Module PG
NVreg_DeviceFileGID                           | int    | GID integer (e.g. 0-65535)            | GID for nvidia device files.                            | NVIDIA Kernel Module PG
NVreg_DeviceFileMode                          | int    | Octal int (e.g. 0660, 0777)           | Permissions mask for nvidia files.                      | NVIDIA Kernel Module PG
NVreg_InitializeSystemMemoryAllocations       | int    | 0,1                                   | Enable system memory allocation init.                   | NVIDIA Driver UG
NVreg_UsePageAttributeTable                   | int    | 0,1                                   | Use PAT for memory mappings.                            | NVIDIA Driver UG
NVreg_EnablePCIeGen3                          | int    | 0,1                                   | Enable PCIe Gen3 link speed.                            | NVIDIA Driver UG
NVreg_EnableMSI                               | int    | 0,1                                   | Enable MSI interrupts.                                  | NVIDIA Driver UG
NVreg_EnableStreamMemOPs                      | int    | 0,1                                   | Enable streaming memory ops.                            | NVIDIA Driver UG
NVreg_RestrictProfilingToAdminUsers           | int    | 0,1                                   | If profiling is admin-only.                             | NVIDIA Driver UG
NVreg_PreserveVideoMemoryAllocations          | int    | 0,1                                   | If video RAM preserved after reset.                     | NVIDIA Driver UG
NVreg_EnableS0ixPowerManagement               | int    | 0,1                                   | Enable S0ix power mgmt.                                 | NVIDIA Power Mgmt Docs
NVreg_S0ixPowerManagementVideoMemoryThreshold | int    | MB integer value (e.g. 256)           | S0ix PM VRAM threshold.                                 | NVIDIA Power Mgmt Docs
NVreg_DynamicPowerManagement                  | int    | 0,1                                   | Enable dynamic power mgmt.                              | NVIDIA Power Mgmt Docs
NVreg_DynamicPowerManagementVideoMemoryThreshold | int | MB integer value (e.g. 512)           | Dyn. PM VRAM threshold.                                 | NVIDIA Power Mgmt Docs
NVreg_EnableGpuFirmware                       | int    | 0,1                                   | Enable firmware loading.                                | NVIDIA Firmware UG
NVreg_EnableGpuFirmwareLogs                   | int    | 0,1                                   | Enable firmware logs.                                   | NVIDIA Firmware UG
NVreg_OpenRmEnableUnsupportedGpus             | int    | 0,1                                   | Enable RM for unsupported GPUs.                         | NVIDIA Driver UG
NVreg_EnableUserNUMAManagement                | int    | 0,1                                   | Enable NUMA mgmt for user.                              | NVIDIA Driver UG
NVreg_MemoryPoolSize                          | int    | MB integer (e.g. 1024)                | Size of memory pool.                                    | NVIDIA Driver UG
NVreg_KMallocHeapMaxSize                      | int    | MB integer (e.g. 512)                 | Max kernel malloc heap.                                 | NVIDIA Driver UG
NVreg_VMallocHeapMaxSize                      | int    | MB integer (e.g. 2048)                | Max vmalloc heap.                                       | NVIDIA Driver UG
NVreg_IgnoreMMIOCheck                         | int    | 0,1                                   | Ignore MMIO checks.                                     | NVIDIA Driver UG
NVreg_NvLinkDisable                           | int    | 0,1                                   | Disable NvLink feature.                                 | NVIDIA NvLink UG
NVreg_EnablePCIERelaxedOrderingMode           | int    | 0,1                                   | Enable PCIe relaxed ordering.                           | PCIe Spec, NVIDIA Driver UG
NVreg_RegisterPCIDriver                       | int    | 0,1                                   | Register PCI driver.                                    | NVIDIA Driver UG
NVreg_RegisterPlatformDeviceDriver            | int    | 0,1                                   | Register platform dev driver.                           | NVIDIA Driver UG
NVreg_EnableResizableBar                      | int    | 0,1                                   | Enable resizable BAR.                                   | PCIE Spec, NVIDIA Driver PG
NVreg_EnableDbgBreakpoint                     | int    | 0,1                                   | Enable RM debug breakpoint.                             | NVIDIA Debug Docs
NVreg_EnableNonblockingOpen                   | int    | 0,1                                   | Enable non-blocking open.                               | NVIDIA Driver UG
NVreg_CoherentGPUMemoryMode                   | charp  | "enabled", "disabled"                 | Set coherent GPU memory mode.                           | NVIDIA Driver UG
NVreg_RegistryDwords                          | charp  | "Key1=Value1,Key2=Value2"             | Override reg DWORD values.                              | NVIDIA Registry Docs
NVreg_RegistryDwordsPerDevice                 | charp  | "dev0:Key=Val"                        | DWORD per-device overrides.                             | NVIDIA Registry Docs
NVreg_RmMsg                                   | charp  | Any string                            | Custom RM message.                                      | NVIDIA Driver UG
NVreg_GpuBlacklist                            | charp  | "gpu0,gpu1" (device ids)              | Blacklisted GPUs.                                       | NVIDIA Driver UG
NVreg_TemporaryFilePath                       | charp  | "/tmp/nvidia" (any path)              | Temp file path for driver.                              | NVIDIA Driver UG
NVreg_ExcludedGpus                            | charp  | "uuid1,uuid2"                         | GPUs excluded from use.                                 | NVIDIA Driver UG
NVreg_DmaRemapPeerMmio                        | int    | 0,1                                   | Enable DMA remap for peer MMIO.                         | NVIDIA Driver UG
NVreg_RmNvlinkBandwidth                       | charp  | "bandwidth=25GBps" (key=val)          | Set NVLink bandwidth.                                   | NVIDIA NvLink UG
NVreg_RmNvlinkBandwidthLinkCount              | int    | 1,2,4                                 | Number NVLink bandwidth links.                          | NVIDIA NvLink UG
NVreg_ImexChannelCount                        | int    | 1-8                                   | IMEX channel count.                                     | NVIDIA IMEX Docs
NVreg_CreateImexChannel0                      | int    | 0,1                                   | Create IMEX channel 0.                                  | NVIDIA IMEX Docs
NVreg_GrdmaPciTopoCheckOverride               | int    | 0,1                                   | Override PCI topo GRDMA.                                | NVIDIA Driver UG
rm_firmware_active                            | charp  | "active","inactive","standby"         | RM firmware status.                                     | NVIDIA Firmware UG


phaedrus@primo ~/.G/Q/C/dkms (main)> modinfo nvidia
filename:       /lib/modules/6.16.0-2-cachyos/updates/dkms/nvidia.ko.zst
import_ns:      DMA_BUF
alias:          char-major-195-*
version:        580.65.06
supported:      external
license:        Dual MIT/GPL
firmware:       nvidia/580.65.06/gsp_tu10x.bin
firmware:       nvidia/580.65.06/gsp_ga10x.bin
softdep:        pre: ecdh_generic,ecdsa_generic
srcversion:     689C8CABEC9DC28FEFB0858
alias:          pci:v000010DEd*sv*sd*bc06sc80i00*
alias:          pci:v000010DEd*sv*sd*bc03sc02i00*
alias:          pci:v000010DEd*sv*sd*bc03sc00i00*
alias:          of:N*T*Cnvidia,tegra264-displayC*
alias:          of:N*T*Cnvidia,tegra264-display
alias:          of:N*T*Cnvidia,tegra234-displayC*
alias:          of:N*T*Cnvidia,tegra234-display
depends:
name:           nvidia
retpoline:      Y
vermagic:       6.16.0-2-cachyos SMP preempt mod_unload
sig_id:         PKCS#7
signer:         DKMS module signing key
sig_key:        34:DF:F1:24:5E:07:89:D7:70:2A:37:34:E8:9A:67:48:25:3B:DA:98
sig_hashalgo:   sha512
signature:      63:D5:B1:FE:FA:A8:60:F7:27:65:4B:0E:19:2C:FC:02:40:A3:FD:8E:
                59:DB:86:53:AC:24:C0:95:1D:E1:E5:40:44:55:26:7A:B9:09:CC:70:
                0F:15:E6:04:7B:CE:B4:EA:88:63:8A:88:66:7E:78:85:88:F4:BE:45:
                39:E0:57:14:AB:37:68:72:2B:02:01:0B:7E:4E:36:8D:A9:14:99:9D:
                33:9F:1C:99:93:C1:1E:29:9F:B2:42:F0:1E:3D:A8:F9:1F:01:1E:F7:
                E7:E2:57:A7:70:C5:55:B8:3B:38:34:60:87:35:6A:42:2F:18:16:6D:
                53:EF:83:E9:4A:C3:D4:26:62:F2:CE:E9:AC:BC:7B:20:90:B8:4D:47:
                B3:AA:AF:DE:A8:19:BE:28:15:C1:4E:88:F1:56:EB:14:1B:07:96:A9:
                23:6C:78:C2:38:B5:E9:C2:ED:7A:5E:08:B5:86:F4:FB:CF:FF:0B:19:
                FB:A3:1E:82:FB:43:63:2C:D0:FD:D4:57:39:AB:46:EC:7C:21:83:83:
                99:2F:62:E7:C4:29:75:9D:1D:CB:A1:CE:F2:84:37:70:54:6D:1C:B0:
                E2:2B:70:38:EE:ED:E5:CD:C8:18:2D:5C:DA:6F:E7:AD:DA:E0:42:D1:
                56:BB:C2:FF:69:97:F4:46:F3:91:E6:A0:37:B4:F9:F0
parm:           NvSwitchRegDwords:NvSwitch regkey (charp)
parm:           NvSwitchBlacklist:NvSwitchBlacklist=uuid[,uuid...] (charp)
parm:           NVreg_ResmanDebugLevel:int
parm:           NVreg_RmLogonRC:int
parm:           NVreg_ModifyDeviceFiles:int
parm:           NVreg_DeviceFileUID:int
parm:           NVreg_DeviceFileGID:int
parm:           NVreg_DeviceFileMode:int
parm:           NVreg_InitializeSystemMemoryAllocations:int
parm:           NVreg_UsePageAttributeTable:int                                                                                                                             
parm:           NVreg_EnablePCIeGen3:int
parm:           NVreg_EnableMSI:int
parm:           NVreg_EnableStreamMemOPs:int
parm:           NVreg_RestrictProfilingToAdminUsers:int
parm:           NVreg_PreserveVideoMemoryAllocations:int
parm:           NVreg_EnableS0ixPowerManagement:int
parm:           NVreg_S0ixPowerManagementVideoMemoryThreshold:int
parm:           NVreg_DynamicPowerManagement:int
parm:           NVreg_DynamicPowerManagementVideoMemoryThreshold:int
parm:           NVreg_EnableGpuFirmware:int
parm:           NVreg_EnableGpuFirmwareLogs:int
parm:           NVreg_OpenRmEnableUnsupportedGpus:int
parm:           NVreg_EnableUserNUMAManagement:int
parm:           NVreg_MemoryPoolSize:int
parm:           NVreg_KMallocHeapMaxSize:int
parm:           NVreg_VMallocHeapMaxSize:int
parm:           NVreg_IgnoreMMIOCheck:int
parm:           NVreg_NvLinkDisable:int
parm:           NVreg_EnablePCIERelaxedOrderingMode:int
parm:           NVreg_RegisterPCIDriver:int
parm:           NVreg_RegisterPlatformDeviceDriver:int
parm:           NVreg_EnableResizableBar:int
parm:           NVreg_EnableDbgBreakpoint:int
parm:           NVreg_EnableNonblockingOpen:int
parm:           NVreg_CoherentGPUMemoryMode:charp
parm:           NVreg_RegistryDwords:charp
parm:           NVreg_RegistryDwordsPerDevice:charp
parm:           NVreg_RmMsg:charp
parm:           NVreg_GpuBlacklist:charp
parm:           NVreg_TemporaryFilePath:charp
parm:           NVreg_ExcludedGpus:charp
parm:           NVreg_DmaRemapPeerMmio:int
parm:           NVreg_RmNvlinkBandwidth:charp
parm:           NVreg_RmNvlinkBandwidthLinkCount:int
parm:           NVreg_ImexChannelCount:int
parm:           NVreg_CreateImexChannel0:int
parm:           NVreg_GrdmaPciTopoCheckOverride:int
parm:           rm_firmware_active:charp

</details>

<details>
  <summary style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
    <strong>nvidia_uvm</strong>
  </summary>
  <div style="background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 10px; font-family: monospace;">


m:           uvm_conf_computing_channel_iv_rotation_limit:ulong
parm:           uvm_ats_mode:Set to 0 to disable ATS (Address Translation Services). Any other value is ignored. Has no effect unless the platform supports ATS. (int)
parm:           uvm_perf_prefetch_enable:uint
parm:           uvm_perf_prefetch_threshold:uint
parm:           uvm_perf_prefetch_min_faults:uint
parm:           uvm_perf_thrashing_enable:uint
parm:           uvm_perf_thrashing_threshold:uint
parm:           uvm_perf_thrashing_pin_threshold:uint
parm:           uvm_perf_thrashing_lapse_usec:uint
parm:           uvm_perf_thrashing_nap:uint
parm:           uvm_perf_thrashing_epoch:uint
parm:           uvm_perf_thrashing_pin:uint
parm:           uvm_perf_thrashing_max_resets:uint
parm:           uvm_perf_map_remote_on_native_atomics_fault:uint
parm:           uvm_disable_hmm:Force-disable HMM functionality in the UVM driver. Default: false (HMM is enabled if possible). However, even with uvm_disable_hmm=false, HMM will not be enabled if is not supported in this driver build configuration, or if ATS settings conflict with HMM. (bool)
parm:           uvm_perf_migrate_cpu_preunmap_enable:int
parm:           uvm_perf_migrate_cpu_preunmap_block_order:uint
parm:           uvm_global_oversubscription:Enable (1) or disable (0) global oversubscription support. (int)
parm:           uvm_perf_pma_batch_nonpinned_order:uint
parm:           uvm_cpu_chunk_allocation_sizes:OR'ed value of all CPU chunk allocation sizes. (uint)
parm:           uvm_leak_checker:Enable uvm memory leak checking. 0 = disabled, 1 = count total bytes allocated and freed, 2 = per-allocation origin tracking. (int)
parm:           uvm_force_prefetch_fault_support:uint
parm:           uvm_debug_enable_push_desc:Enable push description tracking (uint)
parm:           uvm_debug_enable_push_acquire_info:Enable push acquire information tracking (uint)
parm:           uvm_page_table_location:Set the location for UVM-allocated page tables. Choices are: vid, sys. (charp)
parm:           uvm_perf_access_counter_migration_enable:Whether access counters will trigger migrations.Valid values: <= -1 (default policy), 0 (off), >= 1 (on) (int)
parm:           uvm_perf_access_counter_batch_count:uint
parm:           uvm_perf_access_counter_threshold:Number of remote accesses on a region required to trigger a notification.Valid values: [1, 65535] (uint)
parm:           uvm_perf_reenable_prefetch_faults_lapse_msec:uint
parm:           uvm_perf_fault_batch_count:uint
parm:           uvm_perf_fault_replay_policy:uint
parm:           uvm_perf_fault_replay_update_put_ratio:uint
parm:           uvm_perf_fault_max_batches_per_service:uint
parm:           uvm_perf_fault_max_throttle_per_service:uint
parm:           uvm_perf_fault_coalesce:uint
parm:           uvm_fault_force_sysmem:Force (1) using sysmem storage for pages that faulted. Default: 0. (int)
parm:           uvm_perf_map_remote_on_eviction:int
parm:           uvm_block_cpu_to_cpu_copy_with_ce:Use GPU CEs for CPU-to-CPU migrations. (int)
parm:           uvm_exp_gpu_cache_peermem:Force caching for mappings to peer memory. This is an experimental parameter that may cause correctness issues if used. (uint)
parm:           uvm_exp_gpu_cache_sysmem:Force caching for mappings to system memory. This is an experimental parameter that may cause correctness issues if used. (uint)
parm:           uvm_downgrade_force_membar_sys:Force all TLB invalidation downgrades to use MEMBAR_SYS (uint)
parm:           uvm_channel_num_gpfifo_entries:uint
parm:           uvm_channel_gpfifo_loc:charp
parm:           uvm_channel_gpput_loc:charp
parm:           uvm_channel_pushbuffer_loc:charp
parm:           uvm_enable_va_space_mm:Set to 0 to disable UVM from using mmu_notifiers to create an association between a UVM VA space and a process. This will also disable pageable memory access via either ATS or HMM. (int)
parm:           uvm_enable_debug_procfs:Enable debug procfs entries in /proc/driver/nvidia-uvm (int)
parm:           uvm_peer_copy:Choose the addressing mode for peer copying, options: phys [default] or virt. Valid for Ampere+ GPUs. (charp)
parm:           uvm_debug_prints:Enable uvm debug prints. (int)
parm:           uvm_enable_builtin_tests:Enable the UVM built-in tests. (This is a security risk) (int)
parm:           uvm_release_asserts:Enable uvm asserts included in release builds. (int)
parm:           uvm_release_asserts_dump_stack:dump_stack() on failed UVM release asserts. (int)
parm:           uvm_release_asserts_set_global_error:Set UVM global fatal error on failed release asserts. (int)


Parameter                                         | Type   | Possible Values / Format          | Description                                                                              | Documentation Reference
--------------------------------------------------|--------|-----------------------------------|------------------------------------------------------------------------------------------|---------------------------
uvm_conf_computing_channel_iv_rotation_limit       | ulong  | Numeric value                    | IV rotation limit for UVM computing channel                                              | NVIDIA UVM Docs
uvm_ats_mode                                      | int    | 0 (disable), [any other = ignored]| Enable/disable Address Translation Services (ATS) if platform supports                   | NVIDIA UVM "ATS"
uvm_perf_prefetch_enable                          | uint   | 0,1                              | Enable UVM prefetch performance optimizations                                            | UVM Performance
uvm_perf_prefetch_threshold                       | uint   | Integer                          | Prefetch fault threshold to trigger prefetch                                             | UVM Performance
uvm_perf_prefetch_min_faults                      | uint   | Integer                          | Minimum faults before enabling prefetch                                                  | UVM Performance
uvm_perf_thrashing_enable                         | uint   | 0,1                              | Enable fault thrashing detection/mitigation                                              | UVM Performance
uvm_perf_thrashing_threshold                      | uint   | Integer                          | Thrashing event threshold                                                                | UVM Performance
uvm_perf_thrashing_pin_threshold                  | uint   | Integer                          | Pin threshold for thrashing mitigation actions                                           | UVM Performance
uvm_perf_thrashing_lapse_usec                     | uint   | Microseconds                     | Thrashing event lapse duration in microseconds                                           | UVM Performance
uvm_perf_thrashing_nap                            | uint   | Integer                          | Nap duration after thrashing detection                                                   | UVM Performance
uvm_perf_thrashing_epoch                          | uint   | Integer                          | Epoch duration for thrashing monitoring                                                  | UVM Performance
uvm_perf_thrashing_pin                            | uint   | 0,1                              | Pin memory on thrashing event                                                            | UVM Performance
uvm_perf_thrashing_max_resets                     | uint   | Integer                          | Maximum number of resets on thrashing                                                    | UVM Performance
uvm_perf_map_remote_on_native_atomics_fault       | uint   | 0,1                              | Map remote memory upon native atomics fault                                              | UVM Fault Handling
uvm_disable_hmm                                   | bool   | true/false (0/1)                 | Force-disable Heterogeneous Memory Management (HMM)                                      | UVM HMM Docs
uvm_perf_migrate_cpu_preunmap_enable              | int    | 0,1                              | Enable CPU pre-unmap migration performance                                               | UVM Migration
uvm_perf_migrate_cpu_preunmap_block_order         | uint   | Integer                          | Block order for CPU pre-unmap migration                                                  | UVM Migration
uvm_global_oversubscription                       | int    | 0,1                              | Enable/disable global oversubscription                                                   | UVM Oversubscription
uvm_perf_pma_batch_nonpinned_order                | uint   | Integer                          | PMA batch non-pinned order                                                              | UVM Performance
uvm_cpu_chunk_allocation_sizes                    | uint   | Bitwise OR'ed sizes              | CPU chunk allocation size mask                                                           | UVM Memory Management
uvm_leak_checker                                 | int    | 0 (off), 1 (bytes), 2 (origin)   | Enable memory leak checker: 0=off, 1=track bytes, 2=track origin                        | UVM Leak Checker
uvm_force_prefetch_fault_support                  | uint   | 0,1                              | Force enabling prefetch fault support                                                    | UVM Prefetch Docs
uvm_debug_enable_push_desc                        | uint   | 0,1                              | Enable push description debug tracking                                                   | UVM Debugging
uvm_debug_enable_push_acquire_info                | uint   | 0,1                              | Enable push acquire info debug tracking                                                  | UVM Debugging
uvm_page_table_location                           | charp  | "vid", "sys"                     | Location for UVM-allocated page tables (video/sys memory)                                | UVM Memory Management
uvm_perf_access_counter_migration_enable          | int    | ≤-1 (default), 0 (off), ≥1 (on)  | Access counter-triggered migrations policy                                               | UVM Migration
uvm_perf_access_counter_batch_count               | uint   | Integer                          | Access counter batching count                                                            | UVM Migration
uvm_perf_access_counter_threshold                 | uint   | 1..65535                         | Remote access threshold to notify                                                        | UVM Migration
uvm_perf_reenable_prefetch_faults_lapse_msec      | uint   | Milliseconds                     | Lapse before reenabling prefetch faults                                                  | UVM Prefetch Docs
uvm_perf_fault_batch_count                        | uint   | Integer                          | Batch count for fault servicing                                                          | UVM Fault Handling
uvm_perf_fault_replay_policy                      | uint   | Integer (policy code)             | Fault replay policy                                                                      | UVM Fault Handling
uvm_perf_fault_replay_update_put_ratio            | uint   | Integer                          | Ratio for fault replay put updates                                                       | UVM Fault Handling
uvm_perf_fault_max_batches_per_service            | uint   | Integer                          | Max fault batches per service                                                            | UVM Fault Handling
uvm_perf_fault_max_throttle_per_service           | uint   | Integer                          | Max fault throttle per service                                                           | UVM Fault Handling
uvm_perf_fault_coalesce                          | uint   | 0,1                              | Coalesce faults                                                                         | UVM Fault Handling
uvm_fault_force_sysmem                           | int    | 0,1                              | Force faulted pages to sysmem storage                                                    | UVM Fault Handling
uvm_perf_map_remote_on_eviction                   | int    | 0,1                              | Map remote memory on eviction                                                            | UVM Eviction Docs
uvm_block_cpu_to_cpu_copy_with_ce                 | int    | 0,1                              | Use GPU copy engines for CPU-CPU migrations                                              | UVM Migration
uvm_exp_gpu_cache_peermem                        | uint   | 0,1                              | (Experimental) Enable cache for peer memory mappings                                     | UVM Experimental
uvm_exp_gpu_cache_sysmem                         | uint   | 0,1                              | (Experimental) Enable cache for sysmem mappings                                          | UVM Experimental
uvm_downgrade_force_membar_sys                   | uint   | 0,1                              | Force TLB invalidations to use MEMBAR_SYS                                                | UVM Memory Mgmt
uvm_channel_num_gpfifo_entries                   | uint   | Integer                          | Number of channel GPFIFO entries                                                         | UVM Channel Mgmt
uvm_channel_gpfifo_loc                           | charp  | Path/String                      | Location for GPFIFO                                                                      | UVM Channel Mgmt
uvm_channel_gpput_loc                            | charp  | Path/String                      | Location for GPPUT                                                                       | UVM Channel Mgmt
uvm_channel_pushbuffer_loc                       | charp  | Path/String                      | Location for pushbuffer                                                                  | UVM Channel Mgmt
uvm_enable_va_space_mm                           | int    | 0,1                              | Enable mmu_notifier for VA space association                                             | UVM MMU Docs
uvm_enable_debug_procfs                          | int    | 0,1                              | Enable UVM procfs debug entries                                                          | UVM Debugging
uvm_peer_copy                                    | charp  | "phys", "virt"                   | Addressing mode for peer copying (Ampere+ GPUs)                                          | UVM Peer Copy Docs
uvm_debug_prints                                 | int    | 0,1                              | Enable UVM debug prints                                                                  | UVM Debugging
uvm_enable_builtin_tests                         | int    | 0,1                              | Enable built-in tests (security risk!)                                                   | UVM Testing
uvm_release_asserts                              | int    | 0,1                              | Enable release assert checks                                                             | UVM Debugging
uvm_release_asserts_dump_stack                   | int    | 0,1                              | Dump stack on failed release assert                                                      | UVM Debugging
uvm_release_asserts_set_global_error             | int    | 0,1                              | Set global error on failed release assert                                                | UVM Debugging




</details>

<details>
  <summary style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
    <strong>nvidia_modeset</strong>
  </summary>
  <div style="background: #f8f9fa; padding: 15px; border-radius: 5px; margin-top: 10px; font-family: monospace;">


Parameter                        | Type   | Possible Values                  | Description
----------------------------------|--------|----------------------------------|----------------------------------------------------------
output_rounding_fix               | bool   | 0 (off), 1 (on)                  | Enable output rounding fix for output position.
disable_hdmi_frl                  | bool   | 0 (off), 1 (on)                  | Disable HDMI Fixed Rate Link (FRL) output mode.
disable_vrr_memclk_switch         | bool   | 0 (off), 1 (on)                  | Disable memory clock switch during VRR.
hdmi_deepcolor                    | bool   | 0 (off), 1 (on)                  | Enable support for HDMI deep color modes.
vblank_sem_control                | bool   | 0 (off), 1 (on)                  | Control VBLANK semaphore usage.
opportunistic_display_sync        | bool   | 0 (off), 1 (on)                  | Opportunistic display pipeline sync.
debug_force_color_space           | uint   | 0 (off), 1, 2, ...               | Force particular color space for debugging.
enable_overlay_layers             | bool   | 0 (off), 1 (on)                  | Enable hardware overlay layers.
fail_malloc                       | int    | Integer (N>=1)                   | Fail the Nth call to nvkms_alloc (for stress testing).
malloc_verbose                    | bool   | 0 (off), 1 (on)                  | Report malloc calls on module unload.
conceal_vrr_caps                  | bool   | 0 (show), 1 (conceal)            | Conceal all display VRR (variable refresh rate) caps.
fail_alloc_core_channel           | int    | Integer (N>=1)                   | Control testing for HW core channel alloc failure.
config_file                       | charp  | path string (e.g. "/etc/nvidia-modeset.conf") | Path to nvidia-modeset config file (default: disabled).


  <details>
    <summary style="padding: 8px; background: #4a5568; color: #fff; border-radius: 6px; cursor: pointer;">
      Show <em>modinfo nvidia_modeset</em> Output
    </summary>

