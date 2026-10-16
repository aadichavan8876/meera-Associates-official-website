import json

tf_path = r"C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
files10 = ['carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5']

# Let's inspect where these 10 files were touched before line 7080
with open(tf_path, 'r', encoding='utf-8') as f:
    for idx, line in enumerate(f):
        if idx >= 7080:
            break
        for scrip in files10:
            key1 = f"scripts/{scrip}/{scrip}.html"
            key2 = f"scripts\\{scrip}\\{scrip}.html"
            if key1 in line or key2 in line:
                try:
                    obj = json.loads(line)
                    tcs = obj.get("tool_calls", [])
                    for tc in tcs:
                        name = tc.get("name", "")
                        args = tc.get("parameters", tc.get("args", {}))
                        if name == "write_to_file":
                            tf = args.get("TargetFile", "")
                            if scrip in tf:
                                print(f"Line {idx}: write_to_file {tf} (content len: {len(args.get('CodeContent',''))})")
                        elif name == "replace_file_content":
                            tf = args.get("TargetFile", "")
                            if scrip in tf:
                                print(f"Line {idx}: replace_file_content {tf} (instr: {args.get('Instruction','')[:60]})")
                        elif name == "run_command":
                            cmd = args.get("CommandLine", "")
                            if scrip in cmd and any(kw in cmd for kw in ["Set-Content", "Out-File", ">", "generate_"]):
                                print(f"Line {idx}: run_command {cmd[:100]}")
                except Exception:
                    pass
