# One Dark Pro Monokai Darker Theme for Nushell
# Based on the VSCode theme

export def main [] {
    {
        # UI elements
        separator: "#abb2bf"
        leading_trailing_space_bg: { attr: n }
        header: { fg: "#e06c75" attr: b }
        empty: "#61afef"

        # Basic types
        bool: "#56b6c2"
        int: "#c678dd"
        filesize: "#d19a66"
        duration: "#d19a66"
        date: "#c678dd"
        range: "#e5c07b"
        float: "#c678dd"
        string: "#e5c07b"
        nothing: "#56b6c2"
        binary: "#c678dd"
        cellpath: "#61afef"

        # Table elements
        row_index: { fg: "#98c379" attr: b }
        record: "#abb2bf"
        list: "#abb2bf"
        block: "#61afef"
        hints: "#5c6370"

        # Search
        search_result: { fg: "#121212" bg: "#e5c07b" }

        # Shapes (syntax highlighting)
        shape_and: { fg: "#e06c75" attr: b }
        shape_binary: { fg: "#c678dd" attr: b }
        shape_block: { fg: "#61afef" attr: b }
        shape_bool: "#56b6c2"
        shape_closure: { fg: "#98c379" attr: b }
        shape_custom: "#98c379"
        shape_datetime: { fg: "#c678dd" attr: b }
        shape_directory: "#61afef"
        shape_external: "#56b6c2"
        shape_externalarg: { fg: "#98c379" attr: b }
        shape_filepath: "#61afef"
        shape_flag: { fg: "#61afef" attr: b }
        shape_float: { fg: "#c678dd" attr: b }
        shape_garbage: { fg: "#bbbbbb" bg: "#f44747" attr: b }
        shape_globpattern: { fg: "#56b6c2" attr: b }
        shape_int: { fg: "#c678dd" attr: b }
        shape_internalcall: { fg: "#56b6c2" attr: b }
        shape_list: { fg: "#56b6c2" attr: b }
        shape_literal: "#61afef"
        shape_match_pattern: "#98c379"
        shape_matching_brackets: { attr: u }
        shape_nothing: "#56b6c2"
        shape_operator: "#e06c75"
        shape_or: { fg: "#e06c75" attr: b }
        shape_pipe: { fg: "#c678dd" attr: b }
        shape_range: { fg: "#e5c07b" attr: b }
        shape_record: { fg: "#56b6c2" attr: b }
        shape_redirection: { fg: "#c678dd" attr: b }
        shape_signature: { fg: "#98c379" attr: b }
        shape_string: "#e5c07b"
        shape_string_interpolation: { fg: "#56b6c2" attr: b }
        shape_table: { fg: "#61afef" attr: b }
        shape_variable: "#61afef"
        shape_vardecl: "#c678dd"
    }
}
