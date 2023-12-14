//
//  File.swift
//  
//
//  Created by Gary Host on 12/13/23.
//

import Foundation
import GRPC
import NIOCore

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
final class PluginServiceProvider: PluginService_RouteDefinitionAsyncProvider {
    func streamHello(request: PluginService_StreamHelloRequest, responseStream: GRPC.GRPCAsyncResponseStreamWriter<PluginService_StreamHelloReply>, context: GRPC.GRPCAsyncServerCallContext) async throws {
        print("Hello world!")
    }
}
