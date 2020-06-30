import tables

const errorCode* = {
  0x00000000: "SUCCESS",
  0x00000001: "INJ_ERR_INVALID_PROC_HANDLE",
  0x00000002: "INJ_ERR_FILE_DOESNT_EXIST",
  0x00000003: "INJ_ERR_OUT_OF_MEMORY_EXT",
  0x00000004: "INJ_ERR_OUT_OF_MEMORY_INT",
  0x00000005: "INJ_ERR_IMAGE_CANT_RELOC",
  0x00000006: "INJ_ERR_LDRLOADDLL_MISSING",
  0x00000007: "INJ_ERR_REMOTEFUNC_MISSING",
  0x00000008: "INJ_ERR_CANT_FIND_MOD_PEB",
  0x00000009: "INJ_ERR_WPM_FAIL",
  0x0000000A: "INJ_ERR_CANT_ACCESS_PEB",
  0x0000000B: "INJ_ERR_CANT_ACCESS_PEB_LDR",
  0x0000000C: "INJ_ERR_VPE_FAIL",
  0x0000000D: "INJ_ERR_CANT_ALLOC_MEM",
  0x0000000E: "INJ_ERR_CT32S_FAIL",
  0x0000000F: "INJ_ERR_RPM_FAIL",
  0x00000010: "INJ_ERR_INVALID_PID",
  0x00000011: "INJ_ERR_INVALID_FILEPATH",
  0x00000012: "INJ_ERR_CANT_OPEN_PROCESS",
  0x00000013: "INJ_ERR_PLATFORM_MISMATCH",
  0x00000014: "INJ_ERR_NO_HANDLES",
  0x00000015: "INJ_ERR_HIJACK_NO_NATIVE_HANDLE",
  0x00000016: "INJ_ERR_HIJACK_INJ_FAILED",
  0x00000017: "INJ_ERR_HIJACK_CANT_ALLOC",
  0x00000018: "INJ_ERR_HIJACK_CANT_WPM",
  0x00000019: "INJ_ERR_HIJACK_INJMOD_MISSING",
  0x0000001A: "INJ_ERR_HIJACK_INJECTW_MISSING",
  0x0000001B: "INJ_ERR_GET_MODULE_HANDLE_FAIL",
  0x0000001C: "INJ_ERR_OUT_OF_MEMORY_NEW",
  0x0000001D: "INJ_ERR_REMOTE_CODE_FAILED",
  0x10000001: "SR_ERR_CANT_QUERY_SESSION_ID",
  0x10000002: "SR_ERR_INVALID_LAUNCH_METHOD",
  0x10100001: "SR_NTCTE_ERR_NTCTE_MISSING",
  0x10100002: "SR_NTCTE_ERR_CANT_ALLOC_MEM",
  0x10100003: "SR_NTCTE_ERR_WPM_FAIL",
  0x10100004: "SR_NTCTE_ERR_NTCTE_FAIL",
  0x10100005: "SR_NTCTE_ERR_GET_CONTEXT_FAIL",
  0x10100006: "SR_NTCTE_ERR_SET_CONTEXT_FAIL",
  0x10100007: "SR_NTCTE_ERR_RESUME_FAIL",
  0x10100008: "SR_NTCTE_ERR_RPM_FAIL",
  0x10100009: "SR_NTCTE_ERR_TIMEOUT",
  0x1010000A: "SR_NTCTE_ERR_GECT_FAIL",
  0x1010000B: "SR_NTCTE_ERR_GET_MODULE_HANDLE_FAIL",
  0x10200001: "SR_HT_ERR_PROC_INFO_FAIL",
  0x10200002: "SR_HT_ERR_NO_THREADS",
  0x10200003: "SR_HT_ERR_OPEN_THREAD_FAIL",
  0x10200004: "SR_HT_ERR_CANT_ALLOC_MEM",
  0x10200005: "SR_HT_ERR_SUSPEND_FAIL",
  0x10200006: "SR_HT_ERR_GET_CONTEXT_FAIL",
  0x10200007: "SR_HT_ERR_WPM_FAIL",
  0x10200008: "SR_HT_ERR_SET_CONTEXT_FAIL",
  0x10200009: "SR_HT_ERR_RESUME_FAIL",
  0x1020000A: "SR_HT_ERR_TIMEOUT",
  0x10300001: "SR_SWHEX_ERR_CANT_QUERY_INFO_PATH",
  0x10300002: "SR_SWHEX_ERR_CANT_OPEN_INFO_TXT",
  0x10300003: "SR_SWHEX_ERR_VAE_FAIL",
  0x10300004: "SR_SWHEX_ERR_CNHEX_MISSING",
  0x10300005: "SR_SWHEX_ERR_WPM_FAIL",
  0x10300006: "SR_SWHEX_ERR_WTSQUERY_FAIL",
  0x10300007: "SR_SWHEX_ERR_DUP_TOKEN_FAIL",
  0x10300008: "SR_SWHEX_ERR_GET_ADMIN_TOKEN_FAIL",
  0x10300009: "SR_SWHEX_ERR_CANT_CREATE_PROCESS",
  0x1030000A: "SR_SWHEX_ERR_SWHEX_TIMEOUT",
  0x1030000B: "SR_SWHEX_ERR_REMOTE_TIMEOUT",
  0x10400001: "SR_QUAPC_ERR_RTLQAW64_MISSING",
  0x10400001: "SR_QUAPC_ERR_CANT_ALLOC_MEM",
  0x10400002: "SR_QUAPC_ERR_WPM_FAIL",
  0x10400003: "SR_QUAPC_ERR_TH32_FAIL",
  0x10400004: "SR_QUAPC_ERR_T32FIRST_FAIL",
  0x10400005: "SR_QUAPC_ERR_NO_APC_THREAD",
  0x10400006: "SR_QUAPC_ERR_TIMEOUT",
  0x10100007: "SR_QUAPC_ERR_GET_MODULE_HANDLE_FAIL",
  0x20000001: "FILE_ERR_CANT_OPEN_FILE",
  0x20000002: "FILE_ERR_INVALID_FILE_SIZE",
  0x20000003: "FILE_ERR_INVALID_FILE",
  0x30000001: "SWHEX_ERR_INVALID_PATH",
  0x30000002: "SWHEX_ERR_CANT_OPEN_FILE",
  0x30000003: "SWHEX_ERR_EMPTY_FILE",
  0x30000004: "SWHEX_ERR_INVALID_INFO",
  0x30000005: "SWHEX_ERR_ENUM_WINDOWS_FAIL",
  0x30000006: "SWHEX_ERR_NO_WINDOWS",
}.toTable