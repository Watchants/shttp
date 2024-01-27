//
//  main.swift
//  snake-httpd
//
//  Created by panghu on 7/5/20.
//

import SHTTP

let bootstrap = Bootstrap(
    configuration: .init(
        host: "127.0.0.1",
        port: 8889,
        handler: .init(
            initialization: false,
            registrable: true
        )
    ),
    eventLoopGroup: .init(numberOfThreads: System.coreCount)
)

bootstrap.register(mappings: AddingsController())

try bootstrap.start().wait()
bootstrap.printAddress()
try bootstrap.onClose.wait()
