<?php	
namespace Craft;

function dump ( $var ) { highlight_string("<?php\n\n" . var_export($var, true) . ";\n?>"); }

return [
    
    'base' => 'api',
    
    'cache' => false,
    
    'routes' => [
        
        '' => function () {
            
            return [
                'meta' => [
                    'title' => 'Brody Associates'
                ],
                'modules' => []
            ];
            
        },
    
        '/menu' => function () {
            
            $entry = craft()
                -> elements
                -> getCriteria( ElementType::Entry, [ 'section' => 'menu' ] )
                -> first();
            
            $menuItems = [];
            
            foreach ( $entry -> menuItems as $item ) {
                
                switch ( $item -> type -> handle ) {
                    
                    case 'discipline':
                        
                        $discipline = $item -> discipline -> first();
                        
                        $criteria = craft()
                            -> elements
                            -> getCriteria( ElementType::Entry, [ 'section' => 'projects', 'relatedTo' => $discipline ] );
                        
                        $children = [];
                        
                        foreach ( $criteria -> find() as $entry ) {
                            
                            $children[] = [
                                'title' => $entry -> title,
                                'id' => $entry -> id,
                                'type' => $entry -> type -> handle,
                                'url' => '/project/' . $entry -> slug,
                                'image' => imageFile( $entry -> thumbnail -> first() ),
                                'children' => []
                            ];

                        }
                        
                        $menuItems[] = [
                            'id' => $discipline -> id,
                            'title' => $discipline -> title,
                            'type' => 'discipline',
                            'children' => $children
                        ];
                        
                        break;
                        
                    case 'single':
                        
                        $entry = $item -> entry -> first();

                        $menuItems[] = [
                            'title' => $entry -> title,
                            'id' => $entry  -> id,
                            'type' => $entry -> type -> handle,
                            'url' => '/' . $entry -> slug,
                            'children' => []
                        ];
                        
                        break;
                    
                }
                
            }
            
            return [
                'type' => 'root',
                "title" => "Brody <span style='color: #9C9B9B'>Associates</span>",
                "url" => "/",
                'children' => $menuItems
            ];
            
        },
        
        '/project/{slug}' => function ( $params, $query ) {
            
            $entry = craft()
                -> elements
                -> getCriteria( ElementType::Entry, [ 'section' => 'projects', 'slug' => $params[ 'slug' ] ] )
                -> first();
            
            $modules = [];

            $modules[] = module( 'background', [ 'color' => $entry -> bgColor -> getHex() ] );
            
            $modules[] = module( 'hero', [] );
            
            $modules[] = module( 'introduction', [
                'text' => getParsedContent( $entry -> intro ),
                'client' => $entry -> client,
                'discipline' => $entry -> discipline -> first() -> title,
                'year' => $entry -> postDate -> format('Y')
            ]);
            
            foreach ( $entry -> modules as $module ) {
                
                switch ( $module -> type -> handle ) {
                    
                    case 'text':
                        
                        $modules[] = module( 'text', [
                            'content' => getParsedContent( $module -> copy ),
                            'width' => $module -> width -> value,
                            'position' => $module -> position -> value,
                        ]);
                        
                        break;
                        
                    case 'visuals':
                        
                        $modules[] = module( 'visuals', [
                            'files' => files( $module -> files ),
                            'width' => $module -> width -> value,
                            'position' => $module -> position -> value,
                            'gutter' => (boolean) $module -> gutter
                        ]);
                    
                }
                
            }
                 
            return [
                'meta' => [
                    'title' => $entry -> title . ' | Brody Associates',
                    'textColor' => $entry -> textColor -> getHex()
                ],
                'modules' => $modules
            ];
            
        }
    
    ]

];

function getParsedContent ( $richTextField ) {
    
    return $richTextField === NULL ? '' : $richTextField -> getParsedContent();
    
}

function module ( $type, $attrs ) {
    
    return [ 'type' => $type, 'attrs' => $attrs ];
    
}

function files ( $assets ) {
    
    $files = [];
    
    foreach ( $assets as $asset ) {
        
        $files[] = file( $asset );
        
    }
    
    return $files;
    
}

function file ( $asset ) {
    
    switch ( $asset -> kind ) {
        
        case 'image':
            return imageFile( $asset );
        
    }
    
}

function imageFile ( $asset ) {
    
    $naturalWidth = $asset -> width;
    $srcs = [];
    
    $transforms = craft() -> assetTransforms -> allTransforms;

    $sortByWidth = function ( $transformA, $transformB ) {
            
        return $transformA -> width > $transformB -> width ? 1 : -1;
    
    };
    
    usort( $transforms, $sortByWidth );
    
    foreach ( $transforms as $transform ) {
        
        if ( count( $srcs ) > 0 && $transform -> width > $naturalWidth ) continue;
        
        $w = $asset -> getWidth( $transform );
        $h = $asset -> getHeight( $transform );
        $url = $asset -> getUrl( $transform );
        
        if ( $w === 1 ) {
            
            $binary = file_get_contents( $url );
            
            $url = sprintf('data:image/%s;base64,%s', $asset->getExtension(), base64_encode($binary) );
            
        }
        
        $srcs[] = [
            'w' => $w,
            'h' => $h,
            'url' => $url
        ];
        
    }
    
    return [
        'type' => 'image',
        'w' => $naturalWidth,
        'h' => $asset -> height,
        'srcs' => $srcs
    ];
    
}