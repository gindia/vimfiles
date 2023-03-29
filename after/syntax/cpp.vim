syntax keyword cppTypes
            \ i8 i16 i32 i64
            \ u8 u16 u32 u64 f32 f64
            \ b32
            \ Mat4
            \ i8x2 i16x2 i32x2 i64x2
            \ u8x2 u16x2 u32x2 u64x2 f32x2 f64x2
            \ i8x3 i16x3 i32x3 i64x3
            \ u8x3 u16x3 u32x3 u64x3 f32x3 f64x3
            \ i8x4 i16x4 i32x4 i64x4
            \ u8x4 u16x4 u32x4 u64x4 f32x4 f64x4
            \ Allocator


hi def link cppTypes Type

syntax keyword cppSpecial
            \ local global function inline_function global_const external_function local_const

hi def link cppSpecial Special
